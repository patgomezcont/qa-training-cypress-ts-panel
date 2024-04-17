#!/bin/bash

version=$(node -v)
version=${version:1}
min_version=16

echo -e "Validating nodejs version..."
if [[ "$version" < "$min_version" ]]; then
  echo -e "ERROR: Node.js version '$version' is not valid. Required version >=$min_version."
  exit 1
fi

echo -n "Installing npm packages"
npm install

echo -n "Testing cypress"
npm run test:run

echo -n "Testing jest"
npm run unit

echo "Everything works correctly. Happy coding! :)"
