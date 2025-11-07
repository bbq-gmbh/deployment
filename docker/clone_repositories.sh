#!/bin/bash

cd "$(dirname "$0")"

mkdir git

git clone https://github.com/bbq-gmbh/backend ./git/backend
git clone https://github.com/bbq-gmbh/frontend2 ./git/frontend
