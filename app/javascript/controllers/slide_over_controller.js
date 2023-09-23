import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['base']

  open(e) {
    if (this.sliding) {
      this.close()
    }

    this.sliding = document.getElementById(this.getSlidingId(e.currentTarget))
    this.slidingWidth = this.sliding.dataset.slidingWidth

    this.sliding.style.left = `calc(100% - ${this.slidingWidth}rem)`
    this.sliding.style.width = `${this.slidingWidth}rem`

    this.sliding.setAttribute('aria-expanded', true)
    this.baseTarget.style.width = `calc(100% - ${this.slidingWidth}rem)`
  }

  close() {
    this.sliding.setAttribute('aria-expanded', false)
    this.baseTarget.style.width = '100%'
    this.sliding = undefined
  }

  getSlidingId(trigger) {
    return `sliding-target-${trigger.dataset.slidingId}`
  }
}
