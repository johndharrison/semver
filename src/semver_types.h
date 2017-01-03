#include <Rcpp.h>
#include "semver200.h"

inline void svptr_finalizer(sv_version::Semver200_version* svptr) {
  delete svptr;
}

typedef Rcpp::XPtr<sv_version::Semver200_version,Rcpp::PreserveStorage, svptr_finalizer> semver200;
