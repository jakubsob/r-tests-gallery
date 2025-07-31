# Interactions with External Services

## When to use this pattern?

Use this pattern to test interactions with external services (like LLMs or other APIs) without making actual calls during testing.

## How this pattern works?

It allows you to separate your code from external dependencies, making tests faster and more reliable.

1. Create an interface using R6 class (e.g., `Chat`) that defines the contract. I suggest using R6 classes for polymorphism, as it allows you to switch implementations with the same interface easily. You can also use functions instead if that feels more natural.
2. Implement concrete classes that wrap actual API clients (e.g., `ChatEllmer` inheriting from `Chat` and using `ellmer::chat_openai()`).
3. Use a [factory function](https://refactoring.guru/design-patterns/factory-method) (`make_<service>()`) where you can inject real or fake implementation of the service. This is your public interface used by your production code. Don't create `ChatEllmer` explicitly, use `make_chat()`. Factory returns an implementation based on passed parameters.
4. Inject fake clients in tests that implement the same interface as real clients but return predictable responses.

The key insight is that **tests never interact with real APIs** - they use fake objects that behave like the real thing but return controlled, predictable responses.

**In production code you use a real implementation** of the service, **in tests you use a fake implementation** that returns fake responses.

## Remember

1. Use dependency injection. Pass services as parameters rather than hardcoding them. Only then testing becomes easy.
2. Create realistic fakes. Fake objects should behave like real clients in terms of input/output structure.
3. Don't test the service itself. Focus on testing your code's interaction with the service interface, not the service's responses.
