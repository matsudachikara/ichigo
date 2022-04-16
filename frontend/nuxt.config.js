export default {
  license: 'UNLICENSED',
  server: {
    host: '0.0.0.0',
  },
  ssr: false,
  components: true,
  modules: [
    '@nuxtjs/axios',
    '@nuxtjs/eslint-module',
    '@nuxtjs/style-resources',
    '@nuxtjs/dayjs',
  ],
  dayjs: {
    plugins: ['isBetween', 'duration'],
  },
  css: [{
    src: '~assets/css/main.scss',
    lang: 'scss'
  }, ],
  styleResources: {
    scss: ['./assets/css/main.scss'],
  },
  purgeCSS: {
    enabled: true,
  },
  plugins: [{
      src: '~/plugins/axios'
    },
    {
      src: '~/plugins/lodash'
    },
  ],
  env: {
    NUXT_HOST: process.env.NUXT_HOST,
    NUXT_PORT: process.env.NUXT_PORT,
    BASE_URL: process.env.BASE_URL,
    API_BASE_URL: process.env.API_BASE_URL,
    BROWSER_API_BASE_URL: process.env.BROWSER_API_BASE_URL,
    ASSETS_URL: process.env.ASSETS_URL,
  },
  publicRuntimeConfig: {},
  build: {
    publicPath: process.env.ASSETS_URL,
    extend(config) {
      config.performance.maxAssetSize = 10000000
      config.performance.maxEntrypointSize = 10000000
    },
    extractCSS: true,
  },
}
