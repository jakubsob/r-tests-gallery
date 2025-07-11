describe("format_msg", {
  it("should format an empty message", {
    # Arrange
    input <- ""

    # Act
    result <- format_message(input)

    # Assert
    expect_equal(result, "The message is: ''")
  })

  it("should format a NULL message", {
    # Arrange
    input <- NULL

    # Act
    result <- format_message(input)

    # Assert
    expect_equal(result, "The message is: ''")
  })

  it("should format a NA message", {
    # Arrange
    input <- NA

    # Act
    result <- format_message(input)

    # Assert
    expect_equal(result, "The message is: 'NA'")
  })

  it("should format a message", {
    # Arrange
    input <- "Hello"

    # Act
    result <- format_message(input)

    # Assert
    expect_equal(result, "The message is: 'Hello'")
  })
})
