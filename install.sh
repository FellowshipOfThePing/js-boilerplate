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
        curl -s -H 'Cache-Control: no-cache' "${prefix}$1" > "./$1"
        echo -e "${ql_cyan}=> Downloaded $1. ${ql_no_color}";
    fi    
}

promptUser() {
    echo -e "${ql_green}=> $1${ql_no_color}";
    echo "";
}

# Create package.json if it doesn't exist
if [ ! -f ./package.json ]; then
    npm init -y
    promptUser "package.json created"
else
    promptUser "package.json already exists"
fi

# Add template scripts to package.json
curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/FellowshipOfThePing/js-boilerplate/master/addScripts.js | node
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
if [ -f ./package-lock.json ]; then
    rm ./package-lock.json
    promptUser "Removed package-lock.json"
fi

# Add template dependencies to package.json
yarn add babel-loader patch-package postinstall-postinstall react-router-dom
yarn add -D @babel/preset-env @babel/preset-react eslint eslint-config-prettier eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react prettier
promptUser "Installed template dependencies"

# Install remaining Yarn packages
yarn

# Init git repo if doesn't already exist
if [ -d ./.git ]; then
    git init
    promptUser "Initialized git repo"
fi

promptUser "Template download complete!"