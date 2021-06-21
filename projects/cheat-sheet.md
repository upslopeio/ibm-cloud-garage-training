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

