test_that("MeanSY works", {
  catalogYM1 <- data.frame(
    year = c(2021, 2021, 2022, 2022),
    magnitude_value_P = c(4, 5, 3, 4),
    stringsAsFactors = FALSE)

  expect_equal(MeanSY(catalogYM1, 2021), is_between(3, 5))

  catalogYM2 <- data.frame(
    year = c(2021, 2021, 2022, 2022),
    magnitude_value_P = c(4, NA, 3, 4),
    stringsAsFactors = FALSE
  )
  expect_error(MeanSY(catalogYM2, 2021), "Resume error: magnitude NA")
})
