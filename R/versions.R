#' Halo Infinite API Version
#'
#' Get or set your Halo Infinite API version as an environment variable.
#'
#' @inheritParams HaloDotAPI
#'
#' @return `get_HaloDotAPI_version()` returns the API version if it is
#'   found as an environment variable.
#'
#' @export
get_HaloDotAPI_version <- function() {
  version <- Sys.getenv('HALODOTAPI_VERSION')
  if (identical(version, '')) {
    version <- HaloDotAPI_versions[[1]]
  }
  version
}

#' @export
#' @rdname get_HaloDotAPI_version
set_HaloDotAPI_version <- function(version) {
  Sys.setenv('HALODOTAPI_VERSION' = version)
}

#' @export
#' @rdname get_HaloDotAPI_version
HaloDotAPI_versions <- c(
  '0.3.6',
  '0.3.5',
  '0.3.4',
  '0.3.3',
  '0.3.2',
  '0.3.1',
  '0.3.0',
  '0.2.3',
  '0.2.2',
  '0.2.1',
  '0.2.0',
  '0.1.4',
  '0.1.3',
  '0.1.2',
  '0.1.1',
  '0.0.3'
)

verify_version <- function(version) {
  if (!rlang::is_scalar_character(version) |
      !version %in% HaloDotAPI_versions) {
    rlang::abort('Not a valid HaloDotAPI version!')
  }
  version
}
