context("parse_version")

test_that("canParseVersions", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff")
  out <- parse_version(version)
  expect_identical(sum(res), -7L)

})
