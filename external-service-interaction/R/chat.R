Chat <- R6::R6Class(
  classname = "Chat",
  public = list(
    initialize = function(client = NULL) {

    },
    chat = function(message) {
      rlang::abort("Not implemented")
    }
  )
)

ChatEllmer <- R6::R6Class(
  classname = "ChatEllmer",
  inherit = Chat,
  private = list(
    client = NULL
  ),
  publi = list(
    initialize = function(client = ellmer::chat_openai()) {
      private$client <- client
    },
    chat = function(message) {
      private$client$chat(message)
    }
  )
)

make_chat <- function(client) {
  if (inherits(client, "Chat")) {
    return(ChatEllmer$new(client))
  }
  rlang::abort(paste("Unknown client type:", paste(class(client), collapse = ", ")))
}
