import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { targetKey: String, default: 'none' }

  static targets = ['item']

  itemTargetConnected(element) {
    const itemKey = element.dataset.itemKey
    if (itemKey === this.targetKeyValue) {
      element.focus()
    }
  }
}
