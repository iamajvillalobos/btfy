import { Controller } from "stimulus";
import ClipboardJS from "clipboard";

export default class extends Controller {
  connect() {
    new ClipboardJS(".btn");
  }

  copy(event) {
    const button = event.currentTarget;
    const clipboard = button.querySelector(".clipboard");
    const clipboardCheck = button.querySelector(".clipboard-check");
    const clipboardText = button.querySelector(".clipboard-text");

    clipboardCheck.classList.remove("d-none");
    clipboardText.classList.remove("d-none");
    clipboard.classList.add("d-none");

    setTimeout(function () {
      clipboardCheck.classList.add("d-none");
      clipboardText.classList.add("d-none");
      clipboard.classList.remove("d-none");
    }, 1000);
  }
}
