import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["baseFare", "numberOfNights", "serviceFee"];
  SERVICE_FEE = 0.18;

  connect() {
    const perNightPrice = this.element.dataset.perNightPrice;
    this.updateDetails();
  }

  updateDetails() {
    this.numberOfNightsTarget.textContent = this.numberOfNights();
    this.baseFareTarget.textContent = this.calculateBaseFare();
    this.serviceFeeTarget.textContent = this.calculateServiceFee();
  }

  numberOfNights() {
    return 4;
  }

  calculateBaseFare() {
    return (this.numberOfNights() * this.element.dataset.perNightPrice).toFixed(
      2
    );
  }

  calculateServiceFee() {
    return (this.calculateBaseFare() * this.SERVICE_FEE).toFixed(2);
  }
}
