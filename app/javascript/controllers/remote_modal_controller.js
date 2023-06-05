import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    url: String,
  }

  load() {
    if (this.frame.src == this.urlValue) {
      this.frame.reload()
    } else {
      this.frame.src = this.urlValue
    }
    const event = new CustomEvent('remote-modal-load', { bubbles: true })
    this.element.dispatchEvent(event)
  }

  get frame() {
    return document.getElementById('remote_modal')
  }
}
