#' Halo Infinite Medals
#'
#' Returns available medals on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#'
#' @return A `list` with class `metadata_medals_list`.
#'
#' @export
halo_medals <- function(version = '0.3.6', token = get_HaloDotAPI_token()) {
  HaloDotAPI(
    endpoint = 'metadata/medals/list',
    version = verify_version(version),
    token = token
  )
}

#' @importFrom tibble as_tibble
#' @export
as_tibble.metadata_medals_list <- function(x, ...) {
  tibble::as_tibble(x$data) %>%
    tidyr::unnest(tidyr::everything(), names_sep = '_')
}
