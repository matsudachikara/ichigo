module.exports = {
  plugins: ['stylelint-order', 'stylelint-scss'],
  extends: [
    'stylelint-config-recommended',
    'stylelint-config-standard',
    'stylelint-config-prettier',
    'stylelint-config-standard-scss',
  ],
  rules: {
    'order/properties-alphabetical-order': true, // アルファベット順に
    'block-no-empty': null, // 空のクラスをエラー判定するかどうか
    'at-rule-no-unknown': [
      true, // @include, @mixin, @each, @extendをエラー判定しない
      { ignoreAtRules: ['include', 'mixin', 'each', 'extend'] },
    ],
    'rule-empty-line-before': null, // 各クラスごとに空行を入れるかどうか
    'at-rule-empty-line-before': null, // @の前に空行を入れるかどうか
  },
}
