Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'sogosearch:sogo-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://www.sogou.com/web?query=#{cased}"
        Shell.openExternal url
