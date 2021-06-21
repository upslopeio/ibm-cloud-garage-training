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

## Styling

**Option 1**

You can just pull in CSS to your application

1. Go to https://getbootstrap.com/
1. Go to "Download"
1. Copy and paste the stylesheet to your `public/index.html` page

Then, whenever you want a styled component, just add the class names.

For example if the Bootstrap docs show you this HTML:

```html
<div class="row">
  <div class="col"></div>
</div>
```

You'd add this to your React component:

```js
<div className="row">
  <div className="col"></div>
</div>
```

**Option 2**

Use a component library:

[https://react-bootstrap.github.io/](https://react-bootstrap.github.io/)
