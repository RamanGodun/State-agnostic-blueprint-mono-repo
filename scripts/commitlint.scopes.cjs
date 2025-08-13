const fs = require('fs');
const path = require('path');

function getPackageDirs(root = 'packages') {
  const rootPath = path.resolve(process.cwd(), root);
  if (!fs.existsSync(rootPath)) return [];
  return fs.readdirSync(rootPath)
    .filter((name) => fs.statSync(path.join(rootPath, name)).isDirectory());
}

module.exports.scopes = getPackageDirs(); // e.g. ['core', 'assets', 'app_bootstrap']