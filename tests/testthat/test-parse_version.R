context("parse_version")

test_that("canParseVersions", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  expect_s3_class(out, "svlist")
  expect_true(all(vapply(out, class, character(1L)) == "svptr"))
  expect_identical(out[[8]]$build, "build.314")
  expect_identical(out[[8]]$prerelease, "alpha.1.2.3")
})
