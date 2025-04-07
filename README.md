https://job-boards.greenhouse.io/bellroy/jobs/6710206?gh_src=0218aee71us

# My Elm + Astro Project

This is a simple web project that combines Astro for the frontend framework with an Elm application for the interactive parts. The project renders a list of stories fetched from a JSON file and styled with global CSS.

## Prerequisites

- [Node.js](https://nodejs.org/) (LTS version is recommended)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- [Elm](https://elm-lang.org/) (the project uses Elm 0.19.1 via npm)

## Setup

1. **Clone the Repository**

   ```bash
   git clone git@github.com:tillydray/my-elm-astro-project.git
   cd my-elm-astro-project
   ```

2. **Install Dependencies**

   Install the required npm packages:

   ```bash
   npm install
   ```

## Running the Project

1. **Build the Elm Application**

   Compile the Elm source code into JavaScript by running:

   ```bash
   npm run build:elm
   ```

   This command compiles `src/Main.elm` into `public/elm.js`. The `--debug` flag is enabled, so you'll have access to Elm's debugging tools in the browser.

2. **Start the Astro Development Server**

   Start the Astro development server with the following command:

   ```bash
   npm run start:astro
   ```

   The server will run on [http://localhost:4321](http://localhost:4321).

3. **View in the Browser**

   Open your browser and navigate to [http://localhost:4321](http://localhost:4321) to see the application in action. The page will load the Elm app into the `<div id="elm-node"></div>` using the inline script in `src/pages/index.astro`.

## Project Structure

- **src/pages/index.astro**
  The main Astro page that loads the Elm application.

- **src/pages/api/stories.json.ts**
  An API endpoint that serves the list of stories as JSON.

- **src/Main.elm**
  The Elm application that fetches data from the API and renders the UI.

- **public/stories.json**
  A JSON file containing the data for the stories.

- **public/global.css**
  Global CSS styles for the application.

- **package.json**
  Contains scripts to build the Elm source, build the Astro project, and start the development server.

## Additional Notes

- The Elm application communicates with the API endpoint (`/api/stories.json`) to load data for rendering stories.
- CSS and asset files are served from the `public` folder.
