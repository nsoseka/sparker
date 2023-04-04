import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["genderFilter", "bloodGroupFilter", "filter"];

  connect() {
    console.log("filter connected");
  }

  toggle(event) {
    const menu =
      event.params.menu === "genderFilter"
        ? this.genderFilterTarget
        : this.bloodGroupFilterTarget;

    if (menu.classList.contains("opacity-100")) {
      menu.classList.remove("transform", "opacity-100", "scale-100");
      menu.classList.add("transform", "opacity-0", "scale-95", "hidden");
    } else {
      menu.classList.remove("transform", "opacity-0", "scale-95", "hidden");
      menu.classList.add("transform", "opacity-100", "scale-100");
    }
  }

  triggerSubmit() {
    this.filterTarget.submit();
  }
}
