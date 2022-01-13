#' Halo Infinite Service Record
#'
#' Returns targeted player's service record on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @inheritParams halo_appearance
#' @param filter Filter.
#'
#' @return A `list` with either class `stats_service_record_campaign` or
#'   `stats_service_record_multiplayer`.
#'
#' @export
halo_campaign <- function(
    gamertag,
    version = '0.3.6',
    token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'stats/service-record/campaign',
    gamertag = verify_scalar_chr(gamertag, 'gamertag'),
    version = verify_version(version),
    token = token
  )
}

#' @importFrom tibble as_tibble
#' @export
as_tibble.stats_service_record_campaign <- function(x, ...) {
  tibble::enframe(rev(x)) %>%
    tidyr::pivot_wider() %>%
    tidyr::unnest_wider(additional) %>%
    tidyr::unnest_wider(data) %>%
    tidyr::unnest_wider(c(audio_logs), names_sep = '_') %>%
    tidyr::unnest_wider(c(difficulty), names_sep = '_') %>%
    tidyr::unnest(tidyr::everything())
}

#' @export
#' @rdname halo_campaign
halo_multiplayer <- function(
    gamertag,
    filter = NULL,
    version = '0.3.6',
    token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'stats/service-record/multiplayer',
    gamertag = verify_scalar_chr(gamertag, 'gamertag'),
    filter = null_or_chr(filter, 'filter'),
    version = verify_version(version),
    token = token
  )
}

#' @importFrom tibble as_tibble
#' @export
as_tibble.stats_service_record_multiplayer <- function(x, ...) {
  tibble::enframe(rev(x)) %>%
    tidyr::pivot_wider() %>%
    tidyr::unnest_wider(additional) %>%
    tidyr::unnest_wider(data, names_sep = '_')
}
