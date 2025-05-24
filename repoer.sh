#!/usr/bin/env bash

set -e

default_help() {
  cat <<EOF
Usage: repo <command> [arguments]
Commands:
  create    Create a new GitHub repository and push current directory
  help      Show this help message
Examples:
  repo create Awesome-Repo "My awesome project" true
EOF
  exit 1
}

create_repo() {
  local repo_name="$1"
  local repo_description="${2:-}"
  local is_private="${3:-false}"

  if [[ -z "$repo_name" ]]; then
    echo "Error: Missing <repo-name>."
    default_help
  fi

  echo "Creating repo: $repo_name"
  response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
    -d "{\"name\": \"$repo_name\"}, \"description\": \"$repo_description\", \
    \"private\": $is_private}" https://api.github.com/user/repos)

  clone_url=$(echo "$response" | grep -o '"clone_url": *"[^"]*' | cut -d '"' -f4)
  if [[ -z "$clone_url" ]]; then
    echo "Failed to create repository. Response:"
    echo "$response"
    exit 1
  fi
  echo "Repository created: $clone_url"

  if [[ ! -d .git ]]; then
    echo "Initializing local git repository ..."
    git init
  fi

  if git remote | grep origin &>/dev/null; then
    git remote remove origin
  fi
  git remote add origin "$clone_url"

  git add .
  git commit -m "Initial commit" || true
  git branch -M master
  git push -u origin HEAD

  echo "Repoer: Create repository success!"
}

