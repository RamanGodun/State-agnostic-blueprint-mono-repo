// Keep comments in English.
module.exports = {
  '**/*.dart': [
    'dart format -o none --set-exit-if-changed',
  ],
  // If you insist on local analyze (slower commits), uncomment:
  // '**/*.dart': [
  //   'dart format -o none --set-exit-if-changed',
  //   'dart analyze --fatal-infos --fatal-warnings'
  // ]
};