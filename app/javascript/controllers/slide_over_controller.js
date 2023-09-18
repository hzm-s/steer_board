import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['sliding', 'base']

  open(el) {
    this.slidingTarget.setAttribute('aria-expanded', true)
    this.baseTarget.style.width = '50%'
  }

  close() {
    this.slidingTarget.setAttribute('aria-expanded', false)
    this.baseTarget.style.width = '100%'
  }
}
