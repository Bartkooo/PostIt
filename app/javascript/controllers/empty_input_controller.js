import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="empty-input"
export default class extends Controller {
  static targets = [ 'input', 'label' ]

  connect() {
    if (this.inputTarget.value != '') {
      this.labelTarget.classList.add('form__label-notempty')
    } else if (this.inputTarget.value == '') {
      this.labelTarget.classList.remove('form__label-notempty')
    }
  }

  update() {
    if (this.inputTarget.value != '') {
      this.labelTarget.classList.add('form__label-notempty')
    } else if (this.inputTarget.value == '') {
      this.labelTarget.classList.remove('form__label-notempty')
    }
  }
}
