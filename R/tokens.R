#' Halo Infinite API Token Management
#'
#' Get or set your Halo Infinite API access token as an environment variable.
#'
#' @inheritParams HaloDotAPI
#'
#' @return `get_HaloDotAPI_token()` invisibly returns the API token if it is
#'   found as an environment variable.
#'
#' @export
get_HaloDotAPI_token <- function() {
  token <- Sys.getenv('HALODOTAPI_TOKEN')
  if (identical(token, '')) {
    rlang::abort('No Halo Infinite API key found!')
  }
  invisible(token)
}

#' @export
#' @rdname get_HaloDotAPI_token
set_HaloDotAPI_token <- function(token = NULL) {
  if (rlang::is_null(token)) {
    token <- askpass::askpass('Please enter your HaloDotAPI token')
  }
  Sys.setenv('HALODOTAPI_TOKEN' = token)
}
