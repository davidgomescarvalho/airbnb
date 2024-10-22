import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["baseFare", "numberOfNights"];

  connect() {
    const perNightPrice = this.element.dataset.perNightPrice;
    this.updateDetails();
  }

  updateDetails() {
    this.numberOfNightsTarget.textContent = this.numberOfNights();
    this.baseFareTarget.textContent = this.calculateBaseFare();
  }

  numberOfNights() {
    return 4;
  }

  calculateBaseFare() {
    return this.numberOfNights() * this.element.dataset.perNightPrice;
  }
}
