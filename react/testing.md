# Testing a React App

Example Component:

```jsx
import React, { useState } from "react";

function App() {
  // define state for the list of books
  const [books, setBooks] = useState([]);

  // define state for the book form
  const [newBook, setNewBook] = useState({ title: "", author: "" });

  // define the function that runs when the form is submitted
  const onSubmit = (e) => {
    e.preventDefault();
    setBooks((books) => [...books, newBook]);
    setNewBook({ title: "", author: "" });
  };

  return (
    <div className="container pt-5">
      <h1>Books</h1>
      <form onSubmit={onSubmit}>
        <p>
          <label htmlFor="title">Title</label>
          <input
            id="title"
            className="form-control"
            type="text"
            name="title"
            value={newBook.title}
            onChange={(e) => setNewBook({ ...newBook, title: e.target.value })}
          />
        </p>
        <p>
          <label htmlFor="author">Author</label>
          <input
            id="author"
            className="form-control"
            type="text"
            name="author"
            value={newBook.author}
            onChange={(e) => setNewBook({ ...newBook, author: e.target.value })}
          />
        </p>
        <button className="btn btn-primary">Add Book</button>
      </form>
      <table className="table table-striped mt-5">
        <tbody>
          {books.map((book, i) => (
            <tr key={i}>
              <td>{book.title}</td>
              <td>{book.author}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default App;
```

Example Test:

```jsx
import { render, screen } from "@testing-library/react";
import App from "./App";
import userEvent from "@testing-library/user-event";

test("allows users to add recovery times", () => {
  render(<App />);

  const titleField = screen.getByLabelText("Title");
  const authorField = screen.getByLabelText("Author");
  userEvent.type(titleField, "Accelerate");
  userEvent.type(authorField, "Jez Humble");
  userEvent.click(screen.getByRole("button"));

  expect(screen.getByText(/Accelerate/)).toBeVisible();
  expect(screen.getByText(/Jez Humble/)).toBeVisible();
});
```

## Links

- https://testing-library.com/docs/ecosystem-user-event/
- https://kentcdodds.com/blog/common-mistakes-with-react-testing-library
- https://www.robinwieruch.de/react-testing-library
