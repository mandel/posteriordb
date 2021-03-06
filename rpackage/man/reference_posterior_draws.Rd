% Generated by roxygen2: do not edit by hand
% Please edit documentation in
%   R/compute_reference_posterior_draws_stan_sampling.R, R/reference_posterior.R
\name{reference_posterior_draws.stanfit}
\alias{reference_posterior_draws.stanfit}
\alias{reference_posterior_draws}
\alias{pdb_reference_posterior_draws}
\alias{reference_posterior_draws.character}
\alias{reference_posterior_draws.pdb_posterior}
\alias{reference_posterior_draws.pdb_reference_posterior_info}
\alias{assert_reference_posterior_draws}
\alias{reference_posterior_expectations}
\title{Reference Posterior posterior Draws and Expectations}
\usage{
\method{reference_posterior_draws}{stanfit}(x, info, pdb = pdb_default(), ...)

reference_posterior_draws(x, ...)

pdb_reference_posterior_draws(x, ...)

\method{reference_posterior_draws}{character}(x, pdb = pdb_default(), ...)

\method{reference_posterior_draws}{pdb_posterior}(x, ...)

\method{reference_posterior_draws}{pdb_reference_posterior_info}(x, pdb = pdb_default(), ...)

assert_reference_posterior_draws(x)

reference_posterior_expectations(x, ...)
}
\arguments{
\item{x}{a [posterior] object or a posterior name.}

\item{info}{a [pdb_reference_posterior_info] object}

\item{pdb}{a [pdb] object (if [x] is a posterior name)}

\item{...}{further arguments supplied to specific methods.}
}
\value{
a [pdb_reference_posterior] object.
}
\description{
Reference Posterior posterior Draws and Expectations
}
