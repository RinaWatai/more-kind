require("dotenv").config();

const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

// ProvidePlugin を環境に追加
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: 'popper.js'
  })
);

module.exports = environment;