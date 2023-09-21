import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['sliding', 'base']
  static values = {
    width: Number
  }

  initialize() {
    this.enabled = true
  }

  connect() {
    document.addEventListener('keydown', (e) => {
      console.log('keydown', e.key)
      this.enabled = false
    })

    this.slidingTarget.style.left = `calc(100% - ${this.widthValue}rem)`
    this.slidingTarget.style.width = `${this.widthValue}rem`
  }

  open(el) {
    if (!this.enabled) {
      this.enabled = true
      return
    }
    this.slidingTarget.setAttribute('aria-expanded', true)
    this.baseTarget.style.width = `calc(100% - ${this.widthValue}rem)`
  }

  close() {
    this.slidingTarget.setAttribute('aria-expanded', false)
    this.baseTarget.style.width = '100%'
  }
}
