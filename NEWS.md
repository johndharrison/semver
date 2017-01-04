# semver 0.1.2

* Add set_ptr, reset_ptr and increment_ptr c++ level functions to act on
  version fields.
* version fields can be set via `$<-` for svptr class

# semver 0.1.1

* Rename version c++ namespace to sv_version due to conflicts with some
  OS system headers (Solaris x86).
* Add #include <stdexcept> as some OS had issues (windows server 2008)

# semver 0.1.0

* Initial release to CRAN

# semver 0.0.4

* Added tests for render_version and misc
* Added basic vignette

# semver 0.0.3

* Internal function render_ptr now returns a list rather than a character 
  vector
* Added a render_version method for svptr and svlist classes

# semver 0.0.2

* Added a shim to the underlying c++ code to compile under c++11.
* Added tests

# semver 0.0.1

* Added a `NEWS.md` file to track changes to the package.



