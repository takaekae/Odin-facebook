import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "hideable" ]

  toggleTargets() {
    if (this.hideableTarget.hidden == true) {
      this.hideableTarget.hidden = false;
    } else {
      this.hideableTarget.hidden = true;
    }
  }
}
