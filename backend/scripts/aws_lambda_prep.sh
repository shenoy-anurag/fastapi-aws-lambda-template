#!/bin/sh
# poetry export --format requirements.txt --without-hashes --output requirements.txt
uv export --format requirements-txt --no-hashes --output-file requirements.txt
