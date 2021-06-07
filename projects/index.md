# Projects

## Kickoff

1. Meet in your squad's main room
1. One person shares their screen and:
   1. Creates a React app
   1. Creates a Gogs repo (in your squad organization)
   1. Pushes the React app to the gogs repo
1. Everyone else:
   1. Clones the Gogs repo (then `cd` into it)
   1. Runs `npm install` to install the project dependencies

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
