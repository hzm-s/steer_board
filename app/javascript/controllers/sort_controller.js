import { Controller } from '@hotwired/stimulus'
import Sortable from 'sortablejs'

const uiOptions = {
  handle: '[data-sort-item="true"]',
  scroll: true,
  animation: 150,
  easing: 'cubic-bezier(1, 0, 0, 1)',
}

export default class extends Controller {
  initialize() {
    this.onEnd = this.onEnd.bind(this)
  }

  connect() {
    const groupName = this.data.get('group')
    const allowSrc = this.data.get('allow-src')
    console.log(allowSrc, '=>', groupName)

    let group = { name: groupName }
    if (allowSrc !== null) {
      group = { ...group, put: [allowSrc] }
    }

    this.sortable = new Sortable(this.element, {
      ...uiOptions,
      group,
      onEnd: this.onEnd,
    })
  }

  disconnect() {
    this.sortable.destroy()
  }

  onEnd(e) {
    console.log('!!! onEnd', e.newIndex)
  }
}
