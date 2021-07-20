# TDD in JavaScript / Jest

> _NOTE_ this tutorial assumes you've already created a react-intro app

## Concepts

When you write automated tests, there are two files:

- Your test file
- Your code file (your production code)

## Red / Green / Refactor

When writing tests, follow these steps (the 3 steps of TDD)

1. **Red** Write a failing test
1. **Green** Make the test pass
1. **Refactor** Make improvements to the code that don't change the behavior

## 2 Rules of TDD

1. Only write production code in response to a failing test
1. Write the simplest thing to make the test pass
   - Write the real implementation once you've written 3 tests

If you follow these rules, it will ensure that you have thorough tests with high test coverage.

## JavaScript / Jest Test Syntax

- Create the test file
- Put it right next to the code file
- name it `<name>.test.js`

```js
test("convert returns 0 when passed 32", () => {});
```

Write the first test:

```js
test("convert returns 0 when passed 32", () => {
  // SEA
  // setup
  const degreesInFahrenheit = 32;
  const expected = 0;

  // execution
  const actual = convert(degreesInFahrenheit);

  // assertion
  expect(actual).toEqual(expected);
});
```

Write the production code file `convert.js`

Write enough code to make it pass:

```js
export default function convert(input) {
  return 0;
}
```

Import the function in the test file and make it green (add this as the first line of the file):

```js
import convert from "./convert";

```

Rinse and repeat until you've written enough tests, and you've written a real implementation.

## Lab

Use the descriptions on the following pages:

- https://www.codewars.com/kata/515e271a311df0350d00000f
- https://www.codewars.com/kata/56efc695740d30f963000557
- https://www.codewars.com/kata/571d42206414b103dc0006a1
- https://www.codewars.com/kata/57d814e4950d8489720008db
- https://www.codewars.com/kata/57a0e5c372292dd76d000d7e

## How do you know what to test?

Test the [ZOMBIES](https://www.agilealliance.org/resources/sessions/test-driven-development-guided-by-zombies/)
