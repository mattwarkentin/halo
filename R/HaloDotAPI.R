#' Perform a Request to the Halo Infinite API
#'
#' This function is the main tool for making requests to the Halo Infinite
#'   API. Most users will not need to use this function directly, but will
#'   instead use the wrapper functions that are specific to the available
#'   endpoints.
#'
#' @param endpoint Endpoint.
#' @param ... Query parameters passed on to the chosen `endpoint`.
#' @param version HaloDotAPI Version.
#' @param token HaloDotAPI Token.
#'
#' @return A `list` with a class that is specific to the chosen `endpoint`.
#'
#' @md
#'
#' @export
HaloDotAPI <- function(
    endpoint,
    ...,
    version = '0.3.6',
    token = get_HaloDotAPI_token()
) {
  endpoint <- verify_endpoint(endpoint)
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

  ep_class <- gsub('[[:punct:]]', '_', endpoint)

  structure(
    .Data = resp,
    class = c(ep_class, 'HaloDotAPI', class(resp))
  )
}
