# Plumber API

## When to use this pattern?

Use this pattern to test a [Plumber](https://www.rplumber.io/) API you own.

## How this pattern works?

1. Launch API in a background process with [`mirai`](https://mirai.r-lib.org/).
2. Perform test requests with [`httr2`](https://httr2.r-lib.org/).
3. [Use a `test-app-<endpoint>.R` file pattern.](https://jakubsobolewski.com/blog/want-to-get-faster-feedback-from-unit-tests/) It will allow you to test one endpoint at a time to get the fastest feedback during development.
4. **Test API responses and business logic separately.**
   1. Wrap business logic in functions/objects that can be tested independently of the API. It will allow you to get feedback on the business logic without needing to start the API server.
   2. Test shapes of API endpoints, not their content. **Focus on what defines a contract** of the API, don't test the actual data returned.

## Remember

1. Use Arrange, Act, Assert (AAA) pattern to structure your tests.
     1. Arrange: Startup the API, prepare requests.
     2. Act: Perform the request.
     3. Assert: Verify the response.
2. Wrap requests code in functions to avoid code duplication and keep the tests readable.
3. Don't duplicate tests of edge cases of business logic in the API tests, test them in the business logic tests only. Focus on happy path, look for things that can go wrong in the API itself, like serialization and deserialization of data.
