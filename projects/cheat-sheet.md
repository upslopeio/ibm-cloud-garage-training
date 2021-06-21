## Working with localStorage

```js
// store an array of objects in localStorage
const data = [{name: "Jeff", role: "Instructor"}, {name: "Abe", role: "Student"}];
localStorage.setItem("participants", JSON.stringify(data));

// retrieve an array of objects from localStorage
const data = JSON.parse(localStorage.getItem("participants"));
```

