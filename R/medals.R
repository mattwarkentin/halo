#' Halo Infinite Medals
#'
#' Returns available medals on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#'
#' @return A `list` with class `medals`.
#'
#' @export
halo_medals <- function(
    version = get_HaloDotAPI_version(),
    token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'metadata/medals/list',
    version = version,
    token = token,
    class = 'medals'
  )
}
