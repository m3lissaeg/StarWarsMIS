// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

import '../js/site.js'

import 'scss/site.scss'
import 'css/style.css'
import 'css/theme.min.css'

// media
const images = require.context('../images', true)
const imagePath = name => images(name, true)
import starsImg from '../images/stars.jpg'
