module.exports =
class ReproduceApmBetaInstallFailView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('reproduce-apm-beta-install-fail')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The ReproduceApmBetaInstallFail package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
