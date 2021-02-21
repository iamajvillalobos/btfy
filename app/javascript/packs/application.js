import "../controllers";
import "../stylesheets/application.scss";
import LocalTime from "local-time";
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("chartkick");
require("chart.js");
import "jquery";
import "popper.js";
import "bootstrap";
import hljs from "highlight.js";
import "highlight.js/scss/hybrid.scss";
import ClipboardJS from "clipboard";

document.addEventListener("turbolinks:load", function () {
  hljs.initHighlighting();
});

LocalTime.start();
