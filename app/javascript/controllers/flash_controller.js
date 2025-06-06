import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["message"];

  connect() {
    this.animateIn();
    this.timeout = setTimeout(() => {
      this.animateOut();
    }, 5000);
  }

  disconnect() {
    if (this.timeout) {
      clearTimeout(this.timeout);
    }
  }

  dismiss() {
    this.animateOut();
  }

  remove() {
    this.element.remove();
  }

  animateIn() {
    this.element.classList.add("animate-fade-in");
  }

  animateOut() {
    this.element.classList.remove("animate-fade-in");
    this.element.classList.add("animate-fade-out");
  }
}
