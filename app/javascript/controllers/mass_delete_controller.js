import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("mass delete controller connected");
  }

  async massDelete() {
    const ids = Array.from(
      document.querySelectorAll("input.user-list-item:checked")
    ).map((user) => Number(user.getAttribute("id")));
    const formData = new FormData();
    formData.append("ids", ids);

    await fetch("/users/mass_delete.json", {
      method: "DELETE",
      credentials: "same-origin",
      body: formData,
      headers: {
        "X-CSRF-Token": this.getMetaValue("csrf-token"),
      },
    }).then(() => console.log("deleted"));

    // window.location.reload();
  }

  getMetaValue(name) {
    const element = document.head.querySelector(`meta[name="${name}"]`);
    return element.getAttribute("content");
  }
}
