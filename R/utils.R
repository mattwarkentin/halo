verify_scalar_chr <- function(x, y) {
  if (!rlang::is_scalar_character(x)) {
    rlang::abort(glue::glue('`{y}` must be a length one character vector!'))
  }
  x
}


verify_scalar_int <- function(x, y) {
  if (!rlang::is_scalar_integerish(x)) {
    rlang::abort(glue::glue('`{y}` must be a length one integer!'))
  }
  x
}

null_or_int <- function(x, y) {
  if (rlang::is_null(x)) {
    return(NULL)
  } else if (!rlang::is_scalar_integerish(x)) {
    rlang::abort(glue::glue('`{y}` must be a length one integer!'))
  }
  x
}

null_or_chr <- function(x, y) {
  if (rlang::is_null(x)) {
    return(NULL)
  } else if (!rlang::is_scalar_character(x)) {
    rlang::abort(glue::glue('`{y}` must be a length one integer!'))
  }
  x
}

verify_count <- function(x) {
  if (rlang::is_null(x)) {
    return(NULL)
  }
  if (!rlang::is_scalar_integerish(x)) {
    rlang::abort(glue::glue('`count` must be a length one integer!'))
  }
  if (x > 25 | x < 0) {
    rlang::abort('`count` must be a positive integer between 0 and 25!')
  }
  x
}

utils::globalVariables(
  names = c(
    'additional',
    'data',
    'id',
    'experience',
    'played_at',
    'audio_logs',
    'difficulty',
    'count',
    'offset',
    'paging',
    'data_stats',
    'plays'
  )
)
