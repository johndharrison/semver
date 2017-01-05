#include "semver_types.h"

using namespace Rcpp;

// [[Rcpp::export]]
List parse_ptr(std::vector< std::string > versions) {
  List out(versions.size());
  for(int i = 0; i < versions.size(); i++){
    sver200 *v = new sver200(versions[i]);
    XPtrsver200 ptr(v);
    ptr.attr("class") = "svptr";
    out[i] = ptr;
  }
  out.attr("class") = "svlist";
  return out;
}

// [[Rcpp::export]]
Rcpp::List render_ptr(XPtrsver200 verPtr) {
  Rcpp::List out;
  // std::vector< std::string > names =  {"major", "minor", "patch",
  //                                      "prerelease", "build"};
  out["major"] = verPtr->major();
  out["minor"] = verPtr->minor();
  out["patch"] = verPtr->patch();
  out["prerelease"] = verPtr->prerelease();
  out["build"] = verPtr->build();
  // out.names() = names;
  return out;
}

// [[Rcpp::export]]
int ptr_comparator(XPtrsver200 verPtr1, XPtrsver200 verPtr2){
  return (*verPtr2 < *verPtr1) - (*verPtr1 < *verPtr2) ;
}

// [[Rcpp::export]]
SEXP set_ptr(XPtrsver200 verPtr, int cint, SEXP newvalue) {
  bver *v1;
  if(cint == 1){
    v1 = new bver(verPtr->set_major(Rcpp::as<int>(newvalue)));
  }
  else if(cint == 2){
    v1 = new bver(verPtr->set_minor(Rcpp::as<int>(newvalue)));
  }
  else if(cint == 3){
    v1 = new bver(verPtr->set_patch(Rcpp::as<int>(newvalue)));
  }
  else if(cint == 4){
    v1 = new bver(verPtr->set_prerelease(Rcpp::as<std::string>(newvalue)));
  }
  else if(cint == 5){
    v1 = new bver(verPtr->set_build(Rcpp::as<std::string>(newvalue)));
  }
  else{
    throw std::range_error("Case should be an int 1-5");
  }
  XPtrbver ptr(v1);
  ptr.attr("class") = "svptr";
  return ptr;
}

// [[Rcpp::export]]
SEXP reset_ptr(XPtrsver200 verPtr, int cint, SEXP newvalue) {
  bver *v1;
  if(cint == 1){
    v1 = new bver(verPtr->reset_major(Rcpp::as<int>(newvalue)));
  }
  else if(cint == 2){
    v1 = new bver(verPtr->reset_minor(Rcpp::as<int>(newvalue)));
  }
  else if(cint == 3){
    v1 = new bver(verPtr->reset_patch(Rcpp::as<int>(newvalue)));
  }
  else if(cint == 4){
    v1 = new bver(verPtr->reset_prerelease(Rcpp::as<std::string>(newvalue)));
  }
  else if(cint == 5){
    v1 = new bver(verPtr->reset_build(Rcpp::as<std::string>(newvalue)));
  }
  else{
    throw std::range_error("Case should be an int 1-5");
  }
  XPtrbver ptr(v1);
  ptr.attr("class") = "svptr";
  return ptr;
}

// [[Rcpp::export]]
SEXP increment_ptr(XPtrsver200 verPtr, int cint, SEXP increment) {
  bver *v1;
  if(cint == 1){
    v1 = new bver(verPtr->inc_major(Rcpp::as<int>(increment)));
  }
  else if(cint == 2){
    v1 = new bver(verPtr->inc_minor(Rcpp::as<int>(increment)));
  }
  else if(cint == 3){
    v1 = new bver(verPtr->inc_patch(Rcpp::as<int>(increment)));
  }
  else{
    throw std::range_error("Case should be an int 1-3");
  }
  XPtrbver ptr(v1);
  ptr.attr("class") = "svptr";
  return ptr;
}
