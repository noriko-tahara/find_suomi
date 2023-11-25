import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  preview(event) {
    const target = event.target;
    const file = target.files[0];
    const reader = new FileReader();
    reader.onload = () => {
      const preview = document.querySelector("#preview");
      if (preview) {
        preview.src = reader.result;
      }
    }
    if (file) {
      reader.readAsDataURL(file);
    }
  }
}