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
  token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'stats/matches/list',
    gamertag = verify_scalar_chr(gamertag, 'gamertag'),
    limit.count = verify_count(count),
    limit.offset = null_or_int(offset, 'offset'),
    mode = null_or_chr(mode, 'mode'),
    version = verify_version(version),
    token = token
  )
}

#' @importFrom tibble as_tibble
#' @export
as_tibble.stats_matches_list <- function(x, ...) {
  tibble::as_tibble(x$data) %>%
    tidyr::unnest(tidyr::everything(), names_sep = '_') %>%
    tidyr::unnest(tidyr::everything(), names_sep = '_') %>%
    tidyr::unnest(tidyr::everything(), names_sep = '_') %>%
    tidyr::unnest(tidyr::everything(), names_sep = '_') %>%
    tibble::add_column(
      gamertag = x$additional$gamertag,
      mode = x$additional$mode,
      .before = 'id'
    )
}

#' Halo Infinite Match Details
#'
#' Returns targeted match's details on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @param id Match ID.
#'
#' @return A `list` with class `stats_matches_retrieve`.
#' @export
halo_matches_retrieve <- function(
    id,
    version = get_HaloDotAPI_version(),
    token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'stats/matches/retrieve',
    id = verify_scalar_chr(id),
    version = verify_version(version),
    token = token
  )
}

#' @importFrom tibble as_tibble
#' @export
as_tibble.stats_matches_retrieve <- function(x, ...) {
  tibble::enframe(x$data) %>%
    tidyr::pivot_wider() %>%
    tidyr::unnest(c(id, experience, played_at))
}
