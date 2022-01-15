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

#' @importFrom tibble as_tibble
#' @export
as_tibble.ugc_search <- function(x, ...) {
  tibble::enframe(x) %>%
    tidyr::pivot_wider() %>%
    tidyr::unnest(count) %>%
    tidyr::unnest_wider(paging, names_sep = '_') %>%
    tidyr::unnest_wider(additional) %>%
    tidyr::unnest(data, names_sep = '_') %>%
    tidyr::unnest(data_stats) %>%
    tidyr::unnest(plays, names_sep = '_')
}
