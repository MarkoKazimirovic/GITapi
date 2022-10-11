test_that("Here was possible to test only expected error", {
  expect_error(tokenAuthentication("Mickey mouse", "."),
               "User name is not entered properly!", fixed=TRUE)
  expect_error(tokenAuthentication("MarkoKazimirovic", "."),
               "Token is not entered properly!", fixed=TRUE)
  expect_error(tokenAuthentication(1, 1),
               "User name is not entered properly!", fixed=TRUE)
  expect_error(tokenAuthentication("MarkoKazimirovic", 1),
               "Token is not entered properly!", fixed=TRUE)
  expect_error(tokenAuthentication(c("Mickey", "mouse"), NULL),
               "User name is not entered properly!", fixed=TRUE)
})
