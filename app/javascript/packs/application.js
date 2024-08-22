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


/*global $*/
$(document).on("click", "#delete-facility", function(e) {
  e.preventDefault();
  var url = $(this).attr("data-url");
  if (confirm("本当に削除しますか？")) {
    $.ajax({
      url: url,
      type: "DELETE",
      dataType: "json",
      success: function(data) {
        alert(data.message);
        // 削除が成功した場合に必要な処理を追加してください
        // 例えば、削除した要素を画面から削除するなど
      },
      error: function(xhr, status, error) {
        alert("削除に失敗しました。");
      }
    });
  }
});

require("jquery");
