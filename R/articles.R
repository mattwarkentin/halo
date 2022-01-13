#' Halo Infinite Articles
#'
#' Returns available articles on Halo Infinite.
#'
#' @param language Desired language.
#' @inheritParams HaloDotAPI
#'
#' @return A `list` with class `articles`.
#'
#' @export
halo_articles <- function(
    language = 'en-US',
    version = '0.3.6',
    token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'articles/list',
    language = verify_scalar_chr(language, 'language'),
    version = verify_version(version),
    token = token
  )
}

#' @importFrom tibble as_tibble
#' @export
as_tibble.articles_list <- function(x, ...) {
  df <- tibble::as_tibble(x$data)
  attributes(df) <- rlang::list2(
    !!!attributes(df),
    count = x$count,
    language = x$additional$language
  )
  df
}
