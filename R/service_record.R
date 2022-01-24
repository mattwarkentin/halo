#' Halo Infinite Service Record
#'
#' Returns targeted player's service record on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @inheritParams halo_appearance
#' @param filter Filter. One of `'matchmade:pvp'`, `'matchmade:social'`,
#'   `'matchmade:ranked'`, `'matchmade:bots'`, or `'custom'`.
#'
#' @return A `list` with either class `stats_service_record_campaign` or
#'   `stats_service_record_multiplayer`.
#'
#' @export
halo_campaign <- function(
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
        endpoint = 'stats/service-record/campaign',
        gamertag = gamertag,
        version = version,
        token = token
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
}


#' @export
#' @rdname halo_campaign
halo_multiplayer <- function(
    gamertag,
    filter = NULL,
    version = get_HaloDotAPI_version(),
    token = get_HaloDotAPI_token(),
    .progress = TRUE
) {
  gamertag <- verify_vector_chr(gamertag, 'gamertag')
  furrr::future_map(
    .x = gamertag,
    .f = function(gamertag) {
      HaloDotAPI(
        endpoint = 'stats/service-record/multiplayer',
        gamertag = gamertag,
        filter = null_or_chr(filter, 'filter'),
        version = version,
        token = token
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
}
