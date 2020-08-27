import { Controller } from "stimulus";
import List from "list.js";

export default class extends Controller {
  connect() {
    new List("links-table", {
      valueNames: ["name"],
    });
  }
}
