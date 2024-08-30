import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  updateWishListStatus() {
    if (this.element.dataset.status === "false") {
      this.element.classList.remove("fill-rgba(0,0,0,0.5)");
      this.element.classList.add("fill-primary");
      this.element.dataset.status = "true";
    } else {
      this.element.classList.add("fill-rgba(0,0,0,0.5)");
      this.element.classList.remove("fill-primary");
      this.element.dataset.status = "false";
    }
  }
}
