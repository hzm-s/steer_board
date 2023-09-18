import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['container']

  open(el) {
    this.containerTarget.setAttribute('aria-expanded', true)
  }

  close() {
    this.containerTarget.setAttribute('aria-expanded', false)
  }
}
