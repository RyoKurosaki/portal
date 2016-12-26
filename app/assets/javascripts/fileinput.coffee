$ ->
  fileinput = new FileInput
  fileinput.jsImgUpload()
  fileinput.jsPdfUpload()
window.Portal = {}

class FileInput
  constructor: ->

  jsImgUpload: =>
    $('.js-img-upload').fileinput
      maxFileCount: 1
      browseClass: 'btn btn-default fileinput-browse-button'
      browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>'
      browseLabel: 'ファイル選択'
      showUpload: false
      showRemove: false
      allowedFileExtensions: ['jpg', 'jpeg', 'gif', 'png']
      msgValidationError: '''
        <span class="text-danger">
          <i class="fa fa-warning"></i> jpg,jpeg,gif,png ファイルのみ有効です。
        </span>
      '''
    return

  jsPdfUpload: =>
    $('.js-pdf-upload').fileinput
      maxFileCount: 1
      browseClass: 'btn btn-default fileinput-browse-button'
      browseIcon: '<i class="glyphicon glyphicon-folder-open"></i>'
      browseLabel: 'ファイル選択'
      showUpload: false
      showRemove: false
      allowedFileExtensions: ['pdf']
      msgValidationError: '''
        <span class="text-danger">
          <i class="fa fa-warning"></i> pdf ファイルのみ有効です。
        </span>
      '''
    return

window.Portal.FileInput = FileInput
