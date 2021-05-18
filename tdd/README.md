# TDD in JavaScript / Jest

> _NOTE_ this tutorial assumes you've already created a react-intro app

## Concepts

When you write automated tests, there are two files:

- Your test file
- Your code file (your production code)

## TDD Behavior - 3 Step

- (Red) Write a failing test
- (Green) Make the test pass
- (Refactor) Make improvements to the code that don't change the behavior
    - Once you've written 3 tests

## 2 Rules of TDD

1. Only write production code in response to a failing test
1. Write the simplest thing to make the test pass

Ensures that you have you complete and thorough.

## Steps

- Create the test file
- Put it right next to the code file
- name it `<name>.test.js`

```js
describe("convert", () => {

    it("returns 0 when passed 32", () => {
        
    });

});
```

Write the first test:

```js
describe("convert", () => {

    it("returns 0 when passed 32", () => {
        // SEA
        // setup
        const degreesInFahrenheit = 32;
        const expected = 0;

        // execution
        const actual = convert(degreesInFahrenheit);

        // assertion
        expect(actual).toEqual(expected);
    });
});
```

Write the production code file `convert.js`

Write enough code to make it pass:

```js
export default function convert(input) {
    return 0;
}
```

Import the function in the test file and make it green:

```
import convert from './convert';

describe("convert", () => {

    it("returns 0 when passed 32", () => {
        // SEA
        // setup
        const degreesInFahrenheit = 32;
        const expected = 0;

        // execution
        const actual = convert(degreesInFahrenheit);

        // assertion
        expect(actual).toEqual(expected);
    });

});
```

Rinse and repeat
