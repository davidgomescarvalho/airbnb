import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  updateWishlistStatus() {
    // Get status if user is logged in or not
    // If user is not logged in, redirect to login page
    // else continue with the below code

    const isUserLoggedIn = this.element.dataset.userLoggedIn;
    if (isUserLoggedIn === "false") {
      document.querySelector(".js-login").click();
      return;
    }
    if (this.element.dataset.status === "false") {
      const propertyId = this.element.dataset.propertyId;
      const userId = this.element.dataset.userId;

      this.addPropertyToWishlist(propertyId, userId);
    } else {
      const wishlistId = this.element.dataset.wishlistId;
      this.removePropertyFromWishlist(wishlistId);
    }
  }

  addPropertyToWishlist(propertyId, userId) {
    const params = {
      property_id: propertyId,
      user_id: userId,
    };

    const options = {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(params),
    };

    fetch("/api/wishlists", options)
      .then((response) => {
        if (!response.ok) {
          console.log("Error", response.status);
        }
        return response.json();
      })
      .then((data) => {
        console.log(data.id);
        this.element.dataset.wishlistId = data.id;
        this.element.dataset.status = "true";
        this.element.classList.remove("fill-none");
        this.element.classList.add("fill-primary");
      })
      .catch((e) => {
        console.error(e);
      });
  }

  removePropertyFromWishlist(wishlistId) {
    fetch("/api/wishlists/" + wishlistId, {
      method: "DELETE",
    })
      .then((response) => {
        this.element.dataset.wishlistId = "";
        this.element.dataset.status = "false";
        this.element.classList.remove("fill-primary");
        this.element.classList.add("fill-none");
      })
      .catch((e) => {
        console.log(e);
      });
  }
}
