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
    season,
    version = get_HaloDotAPI_version(),
    token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'stats/csrs',
    gamertag = verify_scalar_chr(gamertag, 'gamertag'),
    season = verify_scalar_int(season, 'season'),
    version = version,
    token = token
  )
}

#' @importFrom tibble as_tibble
#' @export
as_tibble.stats_csrs <- function(x, ...) {
  tibble::as_tibble(x$data) %>%
    tidyr::unnest(tidyr::everything()) %>%
    tidyr::unnest(tidyr::everything(), names_sep = '_') %>%
    tibble::add_column(
      gamertag = x$additional$gamertag,
      season = x$additional$season,
      .before = 'queue'
    )
}
