import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]
  static values = {
    openClass: { type: String, default: "block" },
    closeClass: { type: String, default: "hidden" }
  }

  connect() {
    this.close()
  }

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()
    
    if (this.menuTarget.classList.contains(this.closeClassValue)) {
      this.open()
    } else {
      this.close()
    }
  }

  open() {
    this.menuTarget.classList.remove(this.closeClassValue)
    this.menuTarget.classList.add(this.openClassValue)
    
    // Close dropdown when clicking outside
    this.boundCloseOnOutsideClick = this.closeOnOutsideClick.bind(this)
    setTimeout(() => {
      document.addEventListener("click", this.boundCloseOnOutsideClick)
    }, 10)
  }

  close() {
    this.menuTarget.classList.remove(this.openClassValue)
    this.menuTarget.classList.add(this.closeClassValue)
    
    if (this.boundCloseOnOutsideClick) {
      document.removeEventListener("click", this.boundCloseOnOutsideClick)
    }
  }

  closeOnOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }

  disconnect() {
    if (this.boundCloseOnOutsideClick) {
      document.removeEventListener("click", this.boundCloseOnOutsideClick)
    }
  }
}
