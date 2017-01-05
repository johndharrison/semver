# semver 0.1.5
* Update basics vignette detailing new methods

# semver 0.1.4
* Added an increment_version method to increment the fields of semantic version objects
* Added tests for increment_version.

# semver 0.1.3
* Added tests for set_version.
* Added a reset_version method to reset the fields of semantic version objects
* Added tests for reset_version.

# semver 0.1.2

* Add set_ptr, reset_ptr and increment_ptr c++ level functions to act on
  version fields.
* Version fields can be set via `$<-` for svptr class
* Added a set_version method to set the fields of semantic version objects

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



