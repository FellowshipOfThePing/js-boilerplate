#!/usr/bin/env bash

set -e;

ql_cyan='\033[1;36m'
ql_green='\033[1;32m'
ql_no_color='\033[0m'

# Download file function
downloadfile() {
    if [ -f "./$1" ]; then
        echo "$1 already exists."
    else 
        prefix='https://raw.githubusercontent.com/FellowshipOfThePing/js-boilerplate/master/'
        curl -s -H 'Cache-Control: no-cache' "${prefix}$1" --output "./$1"
        echo -e "${ql_cyan}=> Downloaded $1. ${ql_no_color}";
    fi    
}

# Download github folder
mkdir -p ./.github
downloadfile ".github/pull_request_template.md"

# Download vscode folder
mkdir -p ./.vscode
downloadfile ".vscode/tasks.json"
downloadfile ".vscode/extensions.json"
downloadfile ".vscode/javascript.code-snippets"
downloadfile ".vscode/settings.json"

# Download other files
downloadfile ".eslintignore"
downloadfile ".eslintrc.js"
downloadfile ".gitignore"
downloadfile ".prettierignore"
downloadfile ".prettierrc"
downloadfile "babel.config.js"
downloadfile "CODEOWNERS"

# Prompt user
echo "";
echo -e "${ql_green}=> Download succeeded.${ql_no_color}";
echo "";