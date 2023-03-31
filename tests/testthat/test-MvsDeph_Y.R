test_that("Depsism_Y works", {
  catalogYM <- data.frame(
    year = c(2021, 2021, 2022, 2022),
    month = c(1, 2, 3, 4),
    depth_value = c(10, 20, 30, 40),
    magnitude_value_P = c(4, 5, 3, 4),
    stringsAsFactors = FALSE)
  plot <- Depsism_Y(catalogYM, 2021)
  expect_true("ggplot" %in% class(plot))
})
