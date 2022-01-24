#' Halo Infinite CSRS
#'
#' Returns targeted player's CSRS on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @inheritParams halo_appearance
#' @param season Targeted season.
#'
#' @return For a single gamertag, a `list` with class `csrs`. For
#'   multiple gamertags, a `list` with class `collection` where each item in
#'   the `list` is a `list` with class `csrs`.
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
  resps <- furrr::future_map(
    .x = gamertag,
    .f = function(gamertag) {
      HaloDotAPI(
        gamertag = gamertag,
        endpoint = 'stats/csrs',
        season = null_or_int(season, 'season'),
        version = version,
        token = token,
        class = 'csrs'
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
  if (length(gamertag) == 1) return(resps[[1]])
  make_collection(resps)
}
