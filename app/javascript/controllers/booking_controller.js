import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["numberOfNights"];

  connect() {
    const perNightPrice = this.element.dataset.perNightPrice;
    console.log("per night price:", perNightPrice);
  }

  numberOfNights() {
    return 4;
  }
}
