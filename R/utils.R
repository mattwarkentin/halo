HaloDotAPI_endpoints <- c(
  'appearance',
  'stats/csrs',
  'stats/matches/list',
  'stats/matches/retrieve',
  'stats/service-record/campaign',
  'stats/service-record/multiplayer',
  'ugc/search',
  'articles/list',
  'metadata/medals/list'
)

verify_endpoint <- function(endpoint) {
  if (!endpoint %in% HaloDotAPI_endpoints) {
    rlang::abort('Not a valid endpoint!')
  }
  endpoint
}

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

verify_scalar_chr <- function(x, y) {
  if (!rlang::is_scalar_character(x)) {
    rlang::abort(glue::glue('`{y}` must be a length one character vector!'))
  }
  x
}

verify_vector_chr <- function(x, y) {
  if (!rlang::is_character(x)) {
    rlang::abort(glue::glue('`{y}` must be a character vector!'))
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
  count
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
