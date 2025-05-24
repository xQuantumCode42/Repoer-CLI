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