const d3 = require('d3-selection')

// redirect when ajax is successfully
export function redirectOnSuccess (form) {
  form.addEventListener('ajax:success', (event) => {
    window.location = form.dataset.redirect
  })
}

// Clear input errors when input event is triggered
export function clearErrorsOnInput (form) {
  form.addEventListener('input', (event) => {
    d3.select(event.target.parentElement)
      .classed('is-invalid', false)
      .select('.invalid-feedback')
      .remove()
  })
}

// Handle ajax errors and build DOM node to each wrong attributes
export function handleServerSideValidation (form) {
  form.addEventListener('ajax:error', (event) => {
    const [data,, xhr] = event.detail
    const model = form.dataset.model

    if (xhr.status === 422) {
      Object.entries(data).forEach(([key, value]) => {
        // convert error name to form-group class name
        // this is why we need provide model name in form dataset
        const attrClass = '.' + model + '_' + key.replace('.', '_')

        // remove presvious errors
        d3.select('.form-group' + attrClass)
          .select('.invalid-feedback')
          .remove()

        // add new errors
        d3.select('.form-group' + attrClass)
          .classed('is-invalid', true)
          .append('div')
          .attr('class', 'invalid-feedback')
          .text(value[0])
      })
    }
  })
}
