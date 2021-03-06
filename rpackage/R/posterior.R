#' Access a posterior in the posterior database
#'
#' @param x a posterior name that exist in the posterior database
#' @param pdb a \code{pdb} posterior database object.
#' @param ... currently not in use.
#' @export
posterior <- function(x, pdb = pdb_default(), ...) {
  UseMethod("posterior")
}

#' @rdname posterior
#' @export
posterior.character <- function(x, pdb = pdb_default(), ...) {
  checkmate::assert_string(x)
  checkmate::assert_class(pdb, "pdb")
  x <- handle_aliases(x, type = "posteriors", pdb)
  po <- read_info_json(x, "posteriors", pdb)
  pdb(po) <- pdb
  class(po) <- "pdb_posterior"
  po$model_info <- read_model_info(po)
  po$data_info <- read_data_info(po)
  assert_pdb_posterior(po)
  po
}

#' @rdname posterior
#' @export
posterior.list <- function(x, pdb = NULL, ...) {
  class(x) <- "pdb_posterior"
  assert_pdb_posterior(x)
  x
}

#' @rdname posterior
#' @export
pdb_posterior <- posterior

#' @export
print.pdb_posterior <- function(x, ...) {
  cat0("Posterior (", x$name, ")\n\n")
  print(x$data_info)
  cat0("\n")
  print(x$model_info)
  invisible(x)
}

assert_pdb_posterior <- function(x) {
  checkmate::assert_class(x, "pdb_posterior")
  checkmate::assert_list(x)
  must.include <- c(
    "name", "model_name", "data_name", "reference_posterior_name", "dimensions",
    "model_info", "data_info",
    "added_by", "added_date"
  )
  checkmate::assert_names(names(x), must.include = must.include)
  checkmate::assert_list(x$dimensions)
  checkmate::assert_named(x$dimensions)
  checkmate::assert_class(x$added_date, "Date")
  checkmate::assert_class(x$data_info$added_date, "Date")
  checkmate::assert_class(x$model_info$added_date, "Date")
  checkmate::assert_list(x$model_info, min.len = 1)

  checkmate::assert_class(pdb(x), "pdb")
  invisible(x)
}
