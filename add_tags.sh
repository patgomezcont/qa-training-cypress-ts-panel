#!/bin/bash

echo "To remove the existing tags run: git tag | xargs -n1 git tag -d"
git log --pretty=format:"%h" --all --grep='Add tags creation'  | xargs -n1 git tag 1.1-automated-test-cases
git log --pretty=format:"%h" --all --grep='Should view "Required" message for all fields when user tries to register without filling fields'  | xargs -n1 git tag 1.2-improving-test-quality
git log --pretty=format:"%h" --all --grep='Refactor: simplify checkout tests with beforeEach'  | xargs -n1 git tag 2.1-cross-browsers-testing
git log --pretty=format:"%h" --all --grep='For download app banner'  | xargs -n1 git tag 2.2-snapshot-testing
git log --pretty=format:"%h" --all --grep='Add home snapshot test'  | xargs -n1 git tag 2.3-test-doubles
git log --pretty=format:"%h" --all --grep='Enable printer test using stub and spy'  | xargs -n1 git tag 3.1-behavior-driven-development
git log --pretty=format:"%h" --all --grep='Add search tests using scenario'  | xargs -n1 git tag 3.2-unit-tests
echo "To push the tags run: git push origin --tags -f"