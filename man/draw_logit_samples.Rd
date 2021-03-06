% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PosteriorBootstrap.R
\name{draw_logit_samples}
\alias{draw_logit_samples}
\title{Draw adaptive non-parametric learning samples for logistic regression}
\usage{
draw_logit_samples(
  x,
  y,
  concentration,
  n_bootstrap = 100,
  posterior_sample = NULL,
  gamma_mean = NULL,
  gamma_vcov = NULL,
  threshold = 1e-08,
  num_cores = 1,
  show_progress = FALSE
)
}
\arguments{
\item{x}{The features of the data.}

\item{y}{The outcomes of the data (either \code{0} or \code{1}).}

\item{concentration}{The parameter \code{c} in the paper (page 3, formula 3),}

\item{n_bootstrap}{The number of bootstrap samples required.}

\item{posterior_sample}{The function can take samples from the posterior to
generate non-parametric-learning samples, or it can take NULL and the
posterior is assumed normal N(\code{gamma_mean}, \code{gamma_vcov}). If
provided, the posterior sample must have a number of columns equal to the
number of covariates and a number of rows equal or larger than the
`n_bootstrap` (as the algorithm draws a new sample based on a single draw
of the posterior sample).}

\item{gamma_mean}{In case \code{posterior_sample} is NULL, the mean for the
centering model (equation 9, page 4).}

\item{gamma_vcov}{In case \code{posterior_sample} is NULL, the
variance-covariance of the centering model for gamma (equation 9, page 4).}

\item{threshold}{The threshold of stick remaining below which the function
stops looking for more stick-breaks. It correspondes to epsilon in the
paper, at the bottom of page 5 and in algorithm 2 in page 12.}

\item{num_cores}{Number of processor cores for the parallel run of the
algorithm. See \code{mc.cores} in \link[parallel]{mclapply} for details.}

\item{show_progress}{Boolean whether to show the progress of the algorithm in
a progress bar.}
}
\value{
A matrix of bootstrap samples for the parameter of interest.
}
\description{
\code{draw_logit_samples} returns samples of the parameter of interest in a
logistic regression.
}
\details{
This function implements the non-parametric-learning algorithm, which is
algorithm 2 in page 12 in the paper. It uses a mixture of Dirichlet processes
and stick-breaking to find the number of posterior samples and logistic
regression to find the randomized parameter of interest. For examples, see
the vignette.
}
