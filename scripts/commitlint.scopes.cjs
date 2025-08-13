const fs = require('fs');
const path = require('path');

function listDirs(root) {
  const abs = path.resolve(process.cwd(), root);
  if (!fs.existsSync(abs)) return [];
  return fs
    .readdirSync(abs, { withFileTypes: true })
    .filter((d) => d.isDirectory() && !d.name.startsWith('.'))
    .map((d) => d.name);
}

function getScopes(roots = ['packages', 'apps'], extra = []) {
  const fromRoots = roots.flatMap((r) => listDirs(r));
  return Array.from(new Set([...fromRoots, ...extra])).sort();
}

// Глобальні скоупи для робіт на рівні репозиторію:
const defaultExtra = ['repo', 'workflows', 'ci', 'release', 'docs', 'tooling'];

// Додаткові скоупи через ENV: COMMIT_SCOPES="infra,security"
const envExtra = process.env.COMMIT_SCOPES
  ? process.env.COMMIT_SCOPES.split(',').map((s) => s.trim()).filter(Boolean)
  : [];

module.exports.scopes = getScopes(['packages', 'apps'], [...defaultExtra, ...envExtra]);
// Result example: ['app_on_bloc','app_on_riverpod','assets','core','app_bootstrap']