ReproduceApmBetaInstallFailView = require './reproduce-apm-beta-install-fail-view'
{CompositeDisposable} = require 'atom'

module.exports = ReproduceApmBetaInstallFail =
  reproduceApmBetaInstallFailView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @reproduceApmBetaInstallFailView = new ReproduceApmBetaInstallFailView(state.reproduceApmBetaInstallFailViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @reproduceApmBetaInstallFailView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'reproduce-apm-beta-install-fail:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @reproduceApmBetaInstallFailView.destroy()

  serialize: ->
    reproduceApmBetaInstallFailViewState: @reproduceApmBetaInstallFailView.serialize()

  toggle: ->
    console.log 'ReproduceApmBetaInstallFail was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
