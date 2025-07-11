echo_get <- function(msg, host = api_host(), port = api_port()) {
  api_url(host, port) |>
    httr2::request() |>
    httr2::req_url_path("echo") |>
    httr2::req_method("GET") |>
    httr2::req_url_query(msg = msg)
}

perform <- function(req) {
  req |>
    httr2::req_perform() |>
    httr2::resp_body_json()
}

describe("msg", {
  it("should respond to an empty message", {
    # Arrange
    req <- echo_get("")

    # Act
    res <- perform(req)

    # Assert
    expect_length(res$msg, 1)
    expect_type(res$msg[[1]], "character")
  })

  it("should respond to a message", {
    # Arrange
    req <- echo_get("Hello")

    # Act
    res <- perform(req)

    # Assert
    expect_length(res$msg, 1)
    expect_type(res$msg[[1]], "character")
  })
})
