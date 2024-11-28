import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  setRating(e) {
    const starElement = e.currentTarget;
  }
}
