
# halo

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/mattwarkentin/halo/workflows/R-CMD-check/badge.svg)](https://github.com/mattwarkentin/halo/actions)
<!-- badges: end -->

The goal of the `halo` package is to provide a simple, high-level
interface to the Autocode Halo Infinite API (HaloDotAPI). This package
provides a set of functions that makes it easy to query the Halo
Infinite API and always return well-behaved `R` objects.

## Installation

You can install the development version of `halo` from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("mattwarkentin/halo")
```

## HaloDotAPI Token

HaloDotAPI is a free service, however, you are required to authenticate
yourself when making requests to the API. Thankfully, the `halo` package
makes it easy to manage and utilize your token for API requests.

Firstly, you need to acquire an API token that will be used for every
request. This can be done by creating an Autocode account here:
<https://autocode.com/halo/>.

Once you have created an account, you may wish to create
project-specific API tokens, or use a general purpose developer or
production token which can be found in your account by going to
`Account > Identity Tokens > General Use Identity Tokens`.

**Remember, an API token is private and should be kept secure!** Never
share the token with others or check the token into a public repository.

With your token in hand, you can make `halo` aware of your token in
several ways.

1.  Each request function accepts a `token` argument which allows you to
    provide the token directly. This approach is overly verbose and is
    generally not recommended except for quick interactive uses.

2.  Set the environment variable `HALODOTAPI_TOKEN`, and any API request
    will automatically bundle this token in the request for
    authentication. This package provides a function for declaring the
    environment variable via `set_HaloDotAPI_token(token)`.

3.  Add your API token to your user-level `.Renviron` file so the token
    is always available during `R` sessions. All requesting functions
    use the `get_HaloDotAPI_token()` to automatically retrieve the token
    when making a request. This is the recommended approach for token
    use.

## Usage

HaloDotAPI offers nine endpoints and the halo package offers
corresponding functions

-   `halo_appearance()` - Returns targeted player’s appearance on Halo
    Infinite.

-   `halo_CSRS()` - Returns targeted player’s CSRS on Halo Infinite.

-   `halo_matches_list()` - Returns targeted player’s matches history on
    Halo Infinite.

-   `halo_matches_retieve()` - Returns targeted match’s details on Halo
    Infinite.

-   `halo_campaign()` - Returns targeted player’s service record
    (Campaign) on Halo Infinite.

-   `halo_multiplayer()` - Returns targeted player’s service record
    (Multiplayer) on Halo Infinite.

-   `halo_UGC()` - Search for UGC (User-Generated Content) items on Halo
    Infinite.

-   `halo_articles` - Returns available articles on Halo Infinite.

-   `halo_medals()` - Returns available medals on Halo Infinite.

The Halo Infinite API always returns JSON objects, which are
automatically converted to an `R` lists. See
<https://autocode.com/lib/halo/infinite/> for more details on the
structure of the response object.

## Code of Conduct

Please note that the halo project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
