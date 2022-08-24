<h1 align="center">JS-Boilerplate</h1>
<p align="center">Personal JS-Project template, with preferred eslint/pretter settings pre-configured</p>


## Important Config Files

- [`.eslintignore`](./.eslintignore) & [`.eslintrc.js`](./.eslintrc.js) - [ESLint](https://eslint.org) linting config
- [`.prettierignore`](./.prettierignore) & [`.prettierrc`](./.prettierrc) - [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) auto-formatting
- [`package.json`](./package.json) & [`yarn.lock`](./yarn.lock) - Node module management


## ESLint

### Notes

- VSCode is configured to auto-fix any linting errors on save. See settings [here](./.vscode/settings.json).

### Linting in VSCode

- Open the command palette (`⌘` + `shift` + `P`) in VSCode
- Select `Tasks: Run Task`
- Select `eslint: lint whole folder`

### Linting in the CLI

```bash
yarn run style:lint # To detect errors
yarn run style:fix # To detect and fix all fixable errors
```