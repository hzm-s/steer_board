import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['list', 'count']

  connect() {
    this.listTargets.forEach((list) => {
      list.loaded.then(() => {
        this.countTarget.textContent = this.currentCount + this.countListItems(list)
      })
    })
  }

  countListItems(list) {
    return list.querySelectorAll('[data-item-in-list]').length
  }

  get currentCount() {
    const value = this.countTarget.textContent

    if (value === '-') {
      return 0
    }
    return parseInt(value)
  }
}
