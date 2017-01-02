context("test-misc")

test_that("canCallIs_character", {
  test1 <- is_character(2.2)
  test2 <- is_character("2.2")
  test3 <- is_character(2L)
  test4 <- is_character(letters[1:4])
  expect_false(test1)
  expect_true(test2)
  expect_false(test3)
  expect_true(test4)
})
