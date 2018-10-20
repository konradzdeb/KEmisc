#include <Rcpp.h>
using namespace Rcpp;

//' @title Guess Vector Type
//'
//' @details Function analyses content of a factor vector and attempts to
//'   guess the correct type.
//'
//' @param x A vector of factor class.
//'
//' @return A scalar string with class name.
//'
//' @export

// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}
