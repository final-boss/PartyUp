const webpack = require('webpack');
const dotenv  = require('dotenv-webpack');
const extract = require('extract-text-webpack-plugin');
const path    = require('path');

module.exports = {
  entry: [
    './web/static/js/app.js',
    './web/static/css/app.scss'
  ],
  output: {
    path: path.resolve('./priv/static/js'),
    filename: 'app.js'
  },
  resolve: {
    extensions: ['.js', '.jsx', '.json'],
    modules:    ['node_modules', 'priv']
  },
  module: {
    rules: [
        {
          test:    /web\/static\/js\/.*\.jsx?$/,
          exclude: /node_modules|priv/,
          loader:  'babel-loader',
          options: { presets: ['react', 'es2016'] }
        },
        {
          test:    /web\/static\/css\/.*\.scss?$/,
          use:     extract.extract(['css-loader', 'sass-loader'])
        }
    ]
  },
  plugins: [
    new webpack.EnvironmentPlugin([]),
    new dotenv(),
    new extract('../css/app.css')
  ]
};
