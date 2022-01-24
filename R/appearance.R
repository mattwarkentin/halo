#' Halo Infinite Player Appearance
#'
#' Returns targeted player's appearance on Halo Infinite.
#'
#' @param gamertag Character vector of gamertags.
#' @param .progress Logical. Should a progress bar be displayed? Passed on to
#'   `furrr::future_map()`.
#' @inheritParams HaloDotAPI
#'
#' @return For a single gamertag, a `list` with class `appearance`. For
#'   multiple gamertags, a `list` with class `collection` where each item in
#'   the `list` is a `list` with class `appearance`.
#'
#' @export
halo_appearance <- function(
    gamertag,
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
        endpoint = 'appearance',
        version = version,
        token = token,
        class = 'appearance'
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
  if (length(gamertag) == 1) return(resps[[1]])
  make_collection(resps)
}
