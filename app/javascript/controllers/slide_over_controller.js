import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['sliding', 'base', 'trigger']

  open(el) {
    this.slidingWidth = el.currentTarget.dataset.slidingWidth

    this.slidingTarget.style.left = `calc(100% - ${this.slidingWidth}rem)`
    this.slidingTarget.style.width = `${this.slidingWidth}rem`

    this.slidingTarget.setAttribute('aria-expanded', true)
    this.baseTarget.style.width = `calc(100% - ${this.slidingWidth}rem)`
  }

  close() {
    this.slidingTarget.setAttribute('aria-expanded', false)
    this.baseTarget.style.width = '100%'
  }
}
