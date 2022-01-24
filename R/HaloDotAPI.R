#' Perform a Request to the Halo Infinite API
#'
#' This is a low-level function for making requests to the Halo Infinite
#'   API. Most users will not need to use this function directly, but will
#'   instead use one of the wrapper functions that are specific to the
#'   available endpoints.
#'
#' @param endpoint Endpoint.
#' @param ... Query parameters passed on to the chosen `endpoint`.
#' @param version HaloDotAPI Version.
#' @param token HaloDotAPI Token.
#' @param class Class for returned object.
#'
#' @return A `list` with a class that is specific to the chosen `endpoint`.
#'
#' @md
#'
#' @export
HaloDotAPI <- function(
    endpoint,
    ...,
    version,
    token,
    class
) {
  endpoint <- verify_endpoint(endpoint)
  version = verify_version(version)
  url <- glue::glue('https://halo.api.stdlib.com/infinite@{version}/')
  params <- rlang::list2(...)

  resp <-
    httr2::request(url) %>%
    httr2::req_url_path_append(endpoint) %>%
    httr2::req_url_query(!!!params) %>%
    httr2::req_auth_bearer_token(token) %>%
    httr2::req_user_agent('halo (https://github.com/mattwarkentin/halo)') %>%
    httr2::req_perform() %>%
    httr2::resp_body_json(simplifyVector = TRUE)

  structure(
    .Data = resp,
    class = c(class, 'HaloDotAPI', class(resp))
  )
}

HaloDotAPI_endpoints <- c(
  'appearance',
  'stats/csrs',
  'stats/matches/list',
  'stats/matches/retrieve',
  'stats/service-record/campaign',
  'stats/service-record/multiplayer',
  'ugc/search',
  'articles/list',
  'metadata/medals/list'
)

verify_endpoint <- function(endpoint) {
  if (!endpoint %in% HaloDotAPI_endpoints) {
    rlang::abort('Not a valid endpoint!')
  }
  endpoint
}
