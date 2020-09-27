import { Controller } from 'stimulus'

export default class extends Controller {
  connect () {
    const url = this.data.get('redirectUrl')
    setTimeout(() => {
      window.location.href = url
    }, 5000)
  }
}
