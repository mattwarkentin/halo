#' Halo Infinite Player Appearance
#'
#' Returns targeted player's appearance on Halo Infinite.
#'
#' @param gamertag Character vector of gamertags.
#' @param .progress Logical. Should a progress bar be displayed? Passed on to
#'   `furrr::future_map()`.
#' @inheritParams HaloDotAPI
#'
#' @return A `list` with class `appearance`.
#'
#' @export
halo_appearance <- function(
    gamertag,
    version = get_HaloDotAPI_version(),
    token = get_HaloDotAPI_token(),
    .progress = TRUE
) {
  gamertag <- verify_vector_chr(gamertag, 'gamertag')
  furrr::future_map(
    .x = gamertag,
    .f = function(gamertag) {
      HaloDotAPI(
        gamertag = gamertag,
        endpoint = 'appearance',
        version = version,
        token = token
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
}
