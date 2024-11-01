import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
export default class extends Controller {
  static targets = ["baseFare", "numberOfNights", "serviceFee", "totalAmount"];
  SERVICE_FEE = 0.18;

  connect() {
    console.log("datepicker connected", flatpickr);
    this.updateDetails();
  }

  updateDetails() {
    this.numberOfNightsTarget.textContent = this.numberOfNights;
    this.baseFareTarget.textContent = this.calculateBaseFare;
    this.serviceFeeTarget.textContent = this.calculateServiceFee;
    this.totalAmountTarget.textContent = this.calculateTotalAmount;
  }

  get numberOfNights() {
    return 4;
  }

  get calculateBaseFare() {
    return parseFloat(
      (this.numberOfNights * this.element.dataset.perNightPrice).toFixed(2)
    );
  }

  get calculateServiceFee() {
    return parseFloat((this.calculateBaseFare * this.SERVICE_FEE).toFixed(2));
  }

  get calculateTotalAmount() {
    return parseFloat(
      (this.calculateBaseFare + this.calculateServiceFee).toFixed(2)
    );
  }
}
