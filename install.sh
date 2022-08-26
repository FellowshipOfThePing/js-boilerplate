#!/usr/bin/env bash

set -e;

ql_cyan='\033[1;36m'
ql_green='\033[1;32m'
ql_no_color='\033[0m'

# Download file function
downloadfile() {
    if [[ "$2" == "-f" ]]; then
        prefix='https://raw.githubusercontent.com/FellowshipOfThePing/js-boilerplate/master/'
        curl -s -H 'Cache-Control: no-cache' "${prefix}$1" > "./$1"
        echo -e "${ql_cyan}=> Downloaded $1. ${ql_no_color}";
    elif [ -f "./$1" ]; then
        echo "$1 already exists."
    else 
        prefix='https://raw.githubusercontent.com/FellowshipOfThePing/js-boilerplate/master/'
        curl -s -H 'Cache-Control: no-cache' "${prefix}$1" > "./$1"
        echo -e "${ql_cyan}=> Downloaded $1. ${ql_no_color}";
    fi    
}

promptUser() {
    echo "";
    echo -e "${ql_green}=> $1${ql_no_color}";
    echo "";
}

# Create React App
npx create-react-app .
promptUser "CRA Succeeded"

# Add template scripts to package.json
node ./addScripts.js
promptUser "Added Scripts to package.json"

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
promptUser "Successfully downloaded files"

# Remove package-lock.json
rm ./package-lock.json
promptUser "Removed package-lock.json"

# Add template dependencies to package.json
yarn add babel-loader patch-package postinstall-postinstall react-router-dom
yarn add -D @babel/preset-env @babel/preset-react eslint eslint-config-prettier eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react prettier
promptUser "Installed template dependencies"

# Install Yarn Packages
yarn

promptUser "Template download complete!"