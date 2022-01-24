#' Halo Infinite Service Record
#'
#' Returns targeted player's service record on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @inheritParams halo_appearance
#' @param filter Filter. One of `'matchmade:pvp'`, `'matchmade:social'`,
#'   `'matchmade:ranked'`, `'matchmade:bots'`, or `'custom'`.
#'
#' @return For a single gamertag, a `list` with class `campaign` or
#'   `multiplayer`. For multiple gamertags, a `list` with class `collection`
#'   where each item in the `list` is a `list` with class `campaign` or
#'   `multiplayer`.
#'
#' @export
halo_campaign <- function(
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
        endpoint = 'stats/service-record/campaign',
        gamertag = gamertag,
        version = version,
        token = token,
        class = 'campaign'
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
  if (length(gamertag) == 1) return(resps[[1]])
  make_collection(resps)
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
  resps <- furrr::future_map(
    .x = gamertag,
    .f = function(gamertag) {
      HaloDotAPI(
        endpoint = 'stats/service-record/multiplayer',
        gamertag = gamertag,
        filter = null_or_chr(filter, 'filter'),
        version = version,
        token = token,
        class = 'multiplayer'
      )
    },
    .options = furrr::furrr_options(seed = NULL),
    .progress = .progress
  )
  if (length(gamertag) == 1) return(resps[[1]])
  make_collection(resps)
}
