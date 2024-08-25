// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"; ''

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.$ = window.jQuery = require('jquery')
require('packs/raty')
require.context('images/', true);


require("jquery");

/*global jQuery*/
jQuery(document).on("turbolinks:load", function() {
  /*global $*/
  $('#facility_postcode').jpostal({
    postcode : [
      // 取得する郵便番号のテキストボックスをidで指定
      '#facility_postcode'
    ],
    address: {
      // %3 => 都道府県、 %4 => 市区町村 %5 => 町域 %6 => 番地 %7 => 名称
      // それぞれを表示するコントロールをidで指定
      "#facility_prefecture_code"  : "%3",
      "#facility_address_city"   : "%4%5",
      "#facility_address_street" : "%6%7"
    }
  });
});