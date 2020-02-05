require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')

const forms = require('src/forms')

document.addEventListener('turbolinks:load', function () {
  document
    .querySelectorAll('form[data-remote=true]')
    .forEach((el) => {
      forms.handleServerSideValidation(el)
      forms.clearErrorsOnInput(el)
      forms.redirectOnSuccess(el)
    })
})
