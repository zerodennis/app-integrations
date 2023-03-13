#!/bin/bash
set -euo pipefail

repos=(
  NextPayExam.Repo
)

pp_repos=$(echo "${repos[@]}" | sed -e "s/ /, /g")

function usage() {
  cat <<EOF
NAME
    $0 -- Drops, creates and re-seed the umbrella databases for development.

SYNOPSIS
    $0 [-y]

DESCRIPTION
    The $0 script will run mix commands to drop, create and seed
    the following databases:

      ${pp_repos}

EOF
}

function confirmation() {
  echo "$1 [y/N]" >&2
  read answer
  case $answer in
    [yY])
      ;;
    *)
      exit 0
      ;;
  esac
}

opts=${1:-}

case $opts in
  --help)
    usage
    exit 1
    ;;

  -y)
    ;;

  *)
    confirmation "This will drop, create and seed the following dbs:

    ${pp_repos}

Are you sure?"
    ;;
esac

for repo in "${repos[@]}"
do
  echo "mix ecto.drop -r $repo"
  mix ecto.drop -r $repo
done

echo "mix ecto.create"
mix ecto.create

echo "mix ecto.migrate"
mix ecto.migrate

echo "mix run priv/repo/seeds.exs"
mix run priv/repo/seeds.exs
