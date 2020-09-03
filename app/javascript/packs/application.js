import "../controllers";
import "../stylesheets/application.scss";
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("chartkick");
require("chart.js");
import 'bootstrap';
import hljs from "highlight.js"
import "highlight.js/scss/hybrid.scss"

document.addEventListener("turbolinks:load", function() {
  hljs.initHighlighting();
})