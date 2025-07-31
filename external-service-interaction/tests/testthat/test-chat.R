describe("make_chat", {
  it("should generate a string response", {
    # Arrange
    fake_client <- structure(
      list(
        chat = function(input) {
          "Hello, how can I help you?"
        }
      ),
      class = "Chat"
    )
    chat <- make_chat(fake_client)

    # Act
    response <- chat$chat("Hello")

    # Assert
    expect_equal(
      response,
      "Hello, how can I help you?"
    )
  })

  it("should throw an error for an unknown client type", {
    # Arrange
    fake_client <- structure(
      list(
        chat = function(input) {
          "Hello, how can I help you?"
        }
      ),
      class = "UnknownClient"
    )

    # Act, Assert
    expect_snapshot_error(make_chat(fake_client))
  })
})
