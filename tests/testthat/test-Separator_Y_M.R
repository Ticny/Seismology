test_that("SepYM works", {
  catalog1 <- data.frame(
    time_value = c("2021-01-01", "2021-02-01", "2021-03-01", "2021-04-01"),
    value = c(1, 2, 3, 4),
    stringsAsFactors = FALSE)

   expected_catalog1 <- data.frame(
    time_value = as.Date(c("2021-01-01", "2021-02-01", "2021-03-01", "2021-04-01"), "%Y-%m-%d", tz="UTC"),
    year = c("2021", "2021", "2021", "2021"),
    month = c("01", "02", "03", "04"),
    value = c(1, 2, 3, 4),
    stringsAsFactors = FALSE)

  expect_equal(SepYM(catalog1), expected_catalog1)

  catalog2 <- data.frame(
    time_value = c("2021-01-01", "2021-02-01", "2021-03-01", "2021-04-01", "abc"),
    value = c(1, 2, 3, 4, 5),
    stringsAsFactors = FALSE)

  expect_error(SepYM(catalog2), "Resume error:  Expected numeric data")

  catalog3 <- data.frame(
    time_value = c("2021-01-01", "2021-15-01", "2021-03-01", "2021-04-01"),
    value = c(1, 2, 3, 4),
    stringsAsFactors = FALSE)

  expect_error(SepYM(catalog3), "Resume error: Invalid date")

  catalog4 <- data.frame(
    time_value = c("2021/01/01", "01-15-2021", "01/03/2021"),
    value = c(1, 2, 3),
    stringsAsFactors = FALSE)

  expect_error(SepYM(catalog4), "Resume error: Invalid date formats")
})
