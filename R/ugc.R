#' Halo Infinite User-Generated Content
#'
#' Search for UGC (User-Generated Content) items on Halo Infinite.
#'
#' @inheritParams HaloDotAPI
#' @param count Number of items to retrieve.
#' @param offset Number of items to offset.
#' @param author Asset's author (i.e. gamertag).
#' @param kind Asset's kind. One of `'Map'` or `'UgcGameVariant'`.
#' @param tags Character vector of tags.
#'
#' @return A `list` with class `ugc_search`.
#'
#' @export
halo_UGC <- function(
    count = NULL,
    offset = NULL,
    author = NULL,
    kind = NULL,
    tags = NULL,
    version = get_HaloDotAPI_version(),
    token = get_HaloDotAPI_token()
) {
  if (!rlang::is_null(tags)) {
    tags <- paste0(tags, collapse = ',')
  }
  HaloDotAPI(
    endpoint = 'ugc/search',
    limit.count = verify_count(count),
    limit.offset = null_or_int(offset, 'offset'),
    author = null_or_chr(author, 'author'),
    kind = null_or_chr(kind, 'kind'),
    tags = null_or_chr(tags),
    version = version,
    token = token
  )
}
