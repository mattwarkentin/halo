#' Halo Infinite CSRS
#'
#' Returns targeted player's CSRS on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @inheritParams halo_appearance
#' @param season Targeted season.
#'
#' @return A `list` with class `stats_csrs`.
#'
#' @export
halo_CSRS <- function(
    gamertag,
    season = NULL,
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
        endpoint = 'stats/csrs',
        season = null_or_int(season, 'season'),
        version = version,
        token = token
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
}
