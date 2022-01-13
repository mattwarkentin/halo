#' Players Appearance on Halo Infinite
#'
#' Returns targeted player's appearance on Halo Infinite.
#'
#' @param gamertag Player's Gamertag.
#' @inheritParams HaloDotAPI
#'
#' @return A `list` with class `appearance`.
#'
#' @export
halo_appearance <- function(
    gamertag,
    version = '0.3.6',
    token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'appearance',
    gamertag = verify_scalar_chr(gamertag),
    version = verify_version(version),
    token = token
  )
}

#' @importFrom tibble as_tibble
#' @export
as_tibble.appearance <- function(x, ...) {
  tibble::enframe(rev(x)) %>%
    tidyr::pivot_wider() %>%
    tidyr::unnest_wider(additional) %>%
    tidyr::unnest_wider(data)
}
