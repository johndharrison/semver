#include <Rcpp.h>
#include "semver200.h"

typedef sv_version::Semver200_version sver200;
inline void svptr_finalizer(sver200* svptr) {
  delete svptr;
}
typedef Rcpp::XPtr<sver200, Rcpp::PreserveStorage, svptr_finalizer> XPtrsver200;

typedef sv_version::Basic_version<
  sv_version::Semver200_parser,
  sv_version::Semver200_comparator,
  sv_version::Semver200_modifier
  > bver;
inline void bvptr_finalizer(bver* bvptr) {
  delete bvptr;
}
typedef Rcpp::XPtr<bver, Rcpp::PreserveStorage, bvptr_finalizer> XPtrbver;
