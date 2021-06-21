# React Project Cheat Sheet

## React Components

You can see an example of a full component along with tests [here](../react/testing.md).

## Code Organization

Very early on, split the app into multiple components.

Your `App.js` file should be thin, like this:

```js
import Deployment from "./Deployments";
import LeadTimes from "./LeadTimes";
import RecoveryTimes from "./RecoveryTimes";

function App() {
  return (
    <div>
      <Deployment />
      <RecoveryTimes />
      <LeadTimes />
    </div>
  );
}

export default App;
```

Then you should have separate files (with their own separate test files) that look like this:

`Deployments.js`

```js
export default function Deployments() {
    return <div></div>
}
```

`Deployments.test.js`

```js
import { render, screen } from "@testing-library/react";
import Deployments from "./Deployments";
import userEvent from "@testing-library/user-event";

test("allows users to add deployments", () => {
  render(<Deployments />);
  // ...
});
```

## Styling

Add Bootstrap CSS to your application:

1. Go to https://getbootstrap.com/
1. Go to "Download"
1. Copy and paste the stylesheet to your `public/index.html` page

Example layout:

```html
<div className="row">
  <div className="col">
    <!-- deployments go here -->
    <!-- lead time goes here -->
  </div>
  <div className="col">
    <!-- recovery times go here -->
    <!-- change fail rate goes here -->
  </div>
</div>
```

Whenever the Twitter Bootstrap docs show you `class="something"` in React it needs to be `className="something"` (`class` => `className`).

> NOTE: you may also use a component library like https://react-bootstrap.github.io/

## HTML Date Pickers

To add a Date Picker, use this HTML:

```html
<input type="date" />
```

When testing date pickers, set the value in this format: `2021-02-03`

To add a Time Picker, use this HTML:

```html
<input type="time" />
```

## Required Fields

To make a field required add the `required` attribute to HTML:

```html
<input type="date" required />
```

Then make sure that instead of putting an `onClick` event on the button, you put an `onSubmit` on the form.

In the example below, the `createDeployment` function will never be called if the date field isn't filled in.

```jsx
const createDeployment = (e) => {
    e.preventDefault();
};

<form onSubmit={createDeployment}>
    <input type="date" required />
    <button type="submit">
</form>
```

## Working with localStorage

```js
// store an array of objects in localStorage
const data = [{name: "Jeff", role: "Instructor"}, {name: "Abe", role: "Student"}];
localStorage.setItem("participants", JSON.stringify(data));

// retrieve an array of objects from localStorage
const data = JSON.parse(localStorage.getItem("participants"));
```
