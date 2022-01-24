#' Halo Infinite Player Matches
#'
#' Returns targeted player's matches history on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @inheritParams halo_appearance
#' @inheritParams halo_UGC
#' @param mode Targeted mode. One of `'matchmade'` or `'custom'`.
#'
#' @return A `list` with class `stats_matches_list`.
#'
#' @export
halo_matches_list <- function(
  gamertag,
  count = NULL,
  offset = NULL,
  mode = NULL,
  version = get_HaloDotAPI_version(),
  token = get_HaloDotAPI_token(),
  .progress = TRUE
) {
  gamertag <- verify_vector_chr(gamertag, 'gamertag')
  furrr::future_map(
    .x = gamertag,
    .f = function(gamertag) {
      HaloDotAPI(
        endpoint = 'stats/matches/list',
        gamertag = gamertag,
        limit.count = verify_count(count),
        limit.offset = null_or_int(offset, 'offset'),
        mode = null_or_chr(mode, 'mode'),
        version = version,
        token = token
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
}


#' Halo Infinite Match Details
#'
#' Returns targeted match's details on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @inheritParams halo_appearance
#' @param id Character vector of match IDs.
#'
#' @return A `list` with class `stats_matches_retrieve`.
#' @export
halo_matches_retrieve <- function(
    id,
    version = get_HaloDotAPI_version(),
    token = get_HaloDotAPI_token(),
    .progress = TRUE
) {
  id <- verify_vector_chr(id, 'id')
  furrr::future_map(
    .x = id,
    .f = function(id) {
      HaloDotAPI(
        endpoint = 'stats/matches/list',
        id = id,
        version = version,
        token = token
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
}
