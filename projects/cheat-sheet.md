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

## Working with localStorage

```js
// store an array of objects in localStorage
const data = [{name: "Jeff", role: "Instructor"}, {name: "Abe", role: "Student"}];
localStorage.setItem("participants", JSON.stringify(data));

// retrieve an array of objects from localStorage
const data = JSON.parse(localStorage.getItem("participants"));
```

