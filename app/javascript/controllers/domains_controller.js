import { Controller } from "stimulus";
import List from "list.js";

export default class extends Controller {
  connect() {
    var options = {
      valueNames: ["name "],
    };

    var domainList = new List("domains", options);
  }
}
