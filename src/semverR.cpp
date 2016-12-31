#include "semver_types.h"

using namespace Rcpp;

// [[Rcpp::export]]
List parse_ptr(std::vector< std::string > versions) {
  List out(versions.size());
  for(int i = 0; i < versions.size(); i++){
    version::Semver200_version *v = new version::Semver200_version(versions[i]);
    semver200 ptr(v);
    ptr.attr("class") = "svptr";
    out[i] = ptr;
  }
  out.attr("class") = "svlist";
  return out;
}

// [[Rcpp::export]]
Rcpp::StringVector render_ptr(semver200 verPtr) {
  Rcpp::StringVector out(5);
  out[0] = verPtr->major();
  out[1] = verPtr->minor();
  out[2] = verPtr->patch();
  out[3] = verPtr->prerelease();
  out[4] = verPtr->build();
  return out;
}

// [[Rcpp::export]]
int ptr_comparator(semver200 verPtr1, semver200 verPtr2){
  return (*verPtr2 < *verPtr1) - (*verPtr1 < *verPtr2) ;
}
