module.exports = {
  root: true,
  env: {
    browser: true,
    node: true,
  },
  parserOptions: {
    parser: '@babel/eslint-parser',
    sourceType: 'module',
    ecmaVersion: 2015,
  },
  extends: ['plugin:vue/base'],
  plugins: [],
  rules: {},
}
