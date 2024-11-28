import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  setRating(e) {
    console.log(e.currentTarget.tagName);

    const starElement = e.currentTarget;
  }
}
