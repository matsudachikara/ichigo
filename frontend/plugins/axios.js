export default function ({ $axios, route, redirect, store }) {
  $axios.onRequest((config) => {
    if (process.static && process.client) {
      config.baseURL = process.env.BASE_URL
    } else if (process.server) {
      config.baseURL = process.env.API_BASE_URL
    } else {
      config.baseURL = process.env.BROWSER_API_BASE_URL
    }
    return config
  })

  $axios.onResponse((response) => {
    console.log(`[${response.status}] ${response.request.path}`)
  })

  $axios.onError((err) => {
    console.log(
      `[${err.response && err.response.status}] ${
        err.response && err.response.request.path
      }`
    )
    console.log(err.response && err.response.data)
  })

  return new Promise((resolve, reject) => {
    if (store.state.user) {
      $axios.setToken(store.state.user.accessToken, 'Bearer')
    } else {
      $axios.setToken(false)
    }
    resolve()
  })
}
