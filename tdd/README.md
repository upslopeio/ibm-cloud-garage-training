# TDD

From Extreme Programming:

We know that testing code helps produce higher quality code (code with fewer bugs). So let's take it to the _extreme_ and write the tests **first**.

Writing tests is a technical skill. 

Test-Driven Development is a set of **behaviors** that, when followed, increase the value of tests even more.

## Rules of TDD

1. Only write production code in response to a failing test
1. Write the simplest thing to make the test pass
   - Rule of thumb: write "real" code once you've written 3 tests

## Red / Green / Refactor

1. **Red** - Write a failing test
1. **Green** - Make the test pass
1. **Refactor** - Make improvements to the code that don't change the behavior

## TDD in JavaScript / Jest

### Concepts

> _NOTE_ this section assumes you've already created a `react-intro` app

When you write automated tests, there are two files:

- Your test file
- Your code file (your production code)

### Create the test file

- Create the test file in the `src` folder
- Put it right next to the code file
- name it `src/<name>.test.js`

For example create the file `src/convert.test.js`

```js
test("convert returns 0 when passed 32", () => {});
```

### Parts of a Test

Tests have the following parts:

* **S**etup
* **E**xecution
* **A**ssertion
* (optional) **T**eardown

You can remember this with the acronym SEA (or SEAT).

For example:

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

### Write production code

Write the production code file `src/convert.js`

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
