import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  updateWishListStatus() {
    // Get status if user is logged in or not
    // If user is not logged in, redirect to login page
    // else continue with the below code

    const isUserLoggedIn = this.element.dataset.userLoggedIn;
    if (isUserLoggedIn === "false") {
      document.querySelector(".js-login").click();
      return;
    }
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