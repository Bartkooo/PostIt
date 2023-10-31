import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="read-more"
export default class extends Controller {
  static targets = [ 'text', 'button' ]
  static classes = [ 'toggle' ]

  update() {
    this.textTarget.classList.toggle(this.toggleClass)
    this.buttonTarget.classList.toggle('showed')

    this.buttonTarget.innerHTML = this.buttonTarget.classList.contains('showed') ? 'Read less...' : 'Read more...'
  }
}
