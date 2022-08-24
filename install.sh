#!/usr/bin/env bash

set -e;

ql_cyan='\033[1;36m'
ql_green='\033[1;32m'
ql_no_color='\033[0m'

# Download utils file to local machine
curl -H 'Cache-Control: no-cache' "https://raw.githubusercontent.com/FellowshipOfThePing/js-boilerplate/master/.eslintignore" \
--output "./.eslintignore"

# Prompt user
echo "";
echo -e "${ql_green}=> Download succeeded.${ql_no_color}";
echo "";