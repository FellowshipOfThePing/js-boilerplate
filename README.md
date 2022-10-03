<h1 align="center">JS-Boilerplate</h1>
<p align="center">Personal JS-Project template, with preferred eslint/pretter settings pre-configured</p>

## ⚡️ Installation

```bash
curl -s -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/FellowshipOfThePing/js-boilerplate/master/install.sh | bash
```

1. Running this command in your terminal will...
- Init an npm module in the current directory (if package.json is not already found)
- Add template scripts to `package.json` (see [`addScripts.js`](./addScripts.js))
- Add template config files to root directory
- Removes `package-lock.json` (we use `yarn` in this household)
- Install template dependencies
- Install remaining dependencies in `package.json`
- Initialize a git repository (if not already found)
