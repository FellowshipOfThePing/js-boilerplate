<h1 align="center">JS-Boilerplate</h1>
<p align="center">Personal JS-Project template, with preferred eslint/pretter settings pre-configured</p>

## ⚡️ Installation

```bash
curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/FellowshipOfThePing/js-boilerplate/master/install.sh | bash
```

1. Running this command in your terminal will...
- Init an npm module (if package.json is not already found)
- Add template scripts to `package.json` (see [`addScripts.js`](./addScripts.js))
- Add template config files to root directory
- Removes `package-lock.json` (we prefer `yarn` in this household)
- Install template dependencies
- Install remaining dependencies in `package.json`
- Initialize a git repository (if not already found)


## ESLint Notes

### Linting in VSCode

- VSCode is configured to auto-fix any fixable linting errors on save. See settings [here](./.vscode/settings.json).
- Open the command palette (`⌘` + `shift` + `P`) in VSCode
- Select `Tasks: Run Task`
- Select `eslint: lint whole folder`

### Linting in the CLI

```bash
yarn run style:lint # To detect errors
yarn run style:fix # To detect and fix all fixable errors
```