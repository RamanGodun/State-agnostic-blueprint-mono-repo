/** @type {import('@commitlint/types').UserConfig} */
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    // Align with your PR title workflow types
    'type-enum': [
      2,
      'always',
      [
        'feat',
        'fix',
        'perf',
        'refactor',
        'docs',
        'test',
        'build',
        'ci',
        'chore'
      ]
    ],
    'subject-empty': [2, 'never'],
    'header-max-length': [2, 'always', 100]
  }
};