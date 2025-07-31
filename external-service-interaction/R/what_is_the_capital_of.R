#' Dummy production code using the chat interface
#'
#' It doesn't use {ellmer} directly, but an interface we own.
#' We can inject a fake implementation and test the function.
what_is_the_capital_of <- function(country, chat = make_chat(ellmer::chat_openai())) {
  message <- paste0("What is the capital of ", country, "? Give me only the name of the capital city.")
  response <- chat$chat(message)
  response
}
