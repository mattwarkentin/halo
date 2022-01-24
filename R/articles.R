#' Halo Infinite Articles
#'
#' Returns available articles on Halo Infinite.
#'
#' @param language Desired language. One of `'de-DE'`, `'es-ES'`,
#'   `'es-MX'`, `'en-US'`, `'fr-FR'`, `'it-IT'`, `'ja-JP'`, `'ko-KR'`,
#'   `'pl-PL'`, `'pt-BR'`, `'ru-RU'`, `'zh-CN'`, or `'zh-HK'`.
#'   Default is `'en-US'`.
#' @inheritParams HaloDotAPI
#'
#' @return A `list` with class `articles`.
#'
#' @export
halo_articles <- function(
    language = 'en-US',
    version = get_HaloDotAPI_version(),
    token = get_HaloDotAPI_token()
) {
  HaloDotAPI(
    endpoint = 'articles/list',
    language = verify_scalar_chr(language, 'language'),
    version = version,
    token = token
  )
}
