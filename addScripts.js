const fs = require("fs");

const fileName = "./package.json";

// Require current package.json
let file = require(fileName);

// Add scripts to json
file.scripts = {
	...file.scripts,
	start: "react-scripts start",
	build: "react-scripts --max_old_space_size=4096 build",
	postinstall: "patch-package",
	"style:prettier": "prettier --check '**/*.{js,jsx,ts,tsx}'",
	"style:lint": "eslint '**/*.{js,jsx,ts,tsx}'",
	"style:fix": "eslint '**/*.{js,jsx,ts,tsx}' --fix",
	"style:all": "yarn run style:lint && yarn run style:prettier",
	"make-pretty": "prettier --write '**/*.{js,jsx,ts,tsx}'",
};

// Write back to package.json
fs.writeFile(fileName, JSON.stringify(file), (err) => {
	if (err) return console.log(err);
	console.log(JSON.stringify(file, null, 2));
	console.log("writing to " + fileName);
});
