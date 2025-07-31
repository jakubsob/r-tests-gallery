describe("what_is_the_capital_of", {
  it("should return the capital city for a given country", {
    # Arrange
    fake_client <- structure(
      list(
        chat = function(input) {
          if (input == "What is the capital of Poland? Give me only the name of the capital city.") {
            "Warsaw"
          } else {
            "Unknown"
          }
        }
      ),
      class = "Chat"
    )
    chat <- make_chat(fake_client)

    # Act
    response <- what_is_the_capital_of("Poland", chat)

    # Assert
    expect_equal(response, "Warsaw")
  })
})
