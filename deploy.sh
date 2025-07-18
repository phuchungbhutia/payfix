#!/bin/bash

# This script is a basic example for deploying a static website to GitHub Pages.
# It assumes your static files are in the root directory and you're deploying
# to the 'gh-pages' branch or directly from 'main' branch's root.

echo "Starting deployment process..."

# Ensure we are in the correct directory (optional, adjust as needed)
# cd /path/to/your/repo

# Check for uncommitted changes
if ! git diff --quiet HEAD; then
  echo "Warning: You have uncommitted changes. Please commit or stash them before deploying."
  read -p "Do you want to continue anyway? (y/N) " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment aborted."
    exit 1
  fi
fi

# Build step (if you have one, e.g., for React/Vue apps)
# For this simple HTML/JS app, no build step is strictly necessary.
# If you had one, it might look like:
# npm run build
# Or:
# yarn build

# For GitHub Pages, you typically deploy the content of your 'docs' folder
# or the root of your 'main' branch.
# This script assumes 'index.html' is in the root of your repository.

# Option 1: Deploy directly from the current branch (e.g., 'main') to GitHub Pages root
# This requires GitHub Pages to be configured to serve from 'main' branch root.
echo "Pushing current branch content to remote..."
git push origin HEAD

echo "Deployment initiated. Your GitHub Pages site should update shortly."
echo "Check your repository settings -> Pages for deployment status."

# Option 2: Deploy to 'gh-pages' branch (more common for build artifacts)
# This typically involves a tool like 'gh-pages' npm package.
# Example if using 'gh-pages' npm package:
# npm install gh-pages --save-dev
# Then in package.json scripts: "deploy": "gh-pages -d build" (if build output is in 'build' folder)
# And run: npm run deploy
#
# If you want a pure bash solution to push to gh-pages branch:
# git subtree push --prefix build origin gh-pages # If your build output is in 'build' folder
# Or:
# git checkout -b gh-pages
# git add .
# git commit -m "Deploy to GitHub Pages"
# git push -f origin gh-pages
# git checkout main # Go back to your main branch
# echo "Deployed to gh-pages branch."

echo "Deployment script finished."
