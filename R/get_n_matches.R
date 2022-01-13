#' @export
get_n_matches <- function(
    gamertag,
    count,
    mode = NULL,
    version = '0.3.6',
    token = get_HaloDotAPI_token()
) {
  batch <- min(count, 25)
  nbatches <- ceiling(count / batch)
  last_batch <- batch - ((nbatches * batch) - count)
  batch_counts <- c(rep(batch, nbatches - 1), last_batch)
  offsets <- purrr::accumulate(c(0, rep(batch, nbatches - 1)), `+`)
  resp <-
    purrr::map2_dfr(batch_counts, offsets, function(count, offset) {
      halo_matches_list(
        gamertag = gamertag,
        count = count,
        offset = offset,
        mode = mode,
        version = version,
        token = token
      ) %>%
        as_tibble()
    })
  resp
}
