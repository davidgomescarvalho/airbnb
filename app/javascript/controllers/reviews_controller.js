import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Reviews controller");
  }

  toggleReviewsModal() {
    document.getElementById("reviews").click();
  }
}
