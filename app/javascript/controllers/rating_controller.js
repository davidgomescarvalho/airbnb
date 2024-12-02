import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  setRating(e) {
    const rating = e.currentTarget.dataset.rating;

    const ratingInput = e.currentTarget.parentNode.querySelector(
      'input[data-rating-target="cleanliness_rating"]'
    );

    ratingInput.value = rating;
  }
}
