#!/usr/bin/env bash
set -o errexit

mix deps.get --only prod
MIX_ENV=prod mix compile

MIX_ENV=prod mix ecto.migrate

MIX_ENV=prod mix phx.gen.release
MIX_ENV=prod mix release --overwrite