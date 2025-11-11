import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container"];

  connect() {
    // Prevent body scroll when modal is open
    document.body.style.overflow = "hidden";
  }

  disconnect() {
    // Restore body scroll when modal is closed
    document.body.style.overflow = "";
  }

  close(event) {
    // Close modal if clicking outside or on close button
    if (event.target === this.element || event.currentTarget.dataset.action === "click->modal#close") {
      this.element.remove();
    }
  }

  closeWithKeyboard(event) {
    if (event.key === "Escape") {
      this.element.remove();
    }
  }
}
