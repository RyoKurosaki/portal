//= require fileupload.js
//= require fileinput.coffee
//= require ajax_replace_select.coffee

$ ->
  $('#checkin').datetimepicker
    ignoreReadonly: true
    defaultDate: moment({ h: 15 })
  $('#checkout').datetimepicker
    ignoreReadonly: true
    defaultDate: moment({ h: 11 })

  fileinput = new Portal.FileInput

  # 追加ボタンを押されたとき
  $('form').on 'click', '.add_field', (event) ->
    # 現在時刻をミリ秒形式で取得
    time = new Date().getTime()
    # ヘルパーで作ったインデックス値を↑と置換
    regexp = new RegExp($(this).data('id'), 'g')
    # ヘルパーから渡した fields(HTML) を挿入
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
    fileUploadAdd()
    fileinput.jsImgUpload()
    changeFreeItems()

  # 削除ボタンを押されたとき
  $('form').on 'click', '.remove_field', (event) ->
    # 削除ボタンを押したフィールドの _destroy = true にする
    $(this).prev('input[name*=_destroy]').val('true')
    # 削除ボタンが押されたフィールドを隠す
    $(this).closest('.listing_detail').hide()
    event.preventDefault()
    changeFreeItems()

changeFreeItems = () ->
  cnt = 1
  $('.listing_detail').each((i, elem) ->
    if($(elem).is(':visible'))
      $(elem).find('.free-name').text('項目名' + cnt)
      $(elem).find('.free-photo').text('画像' + cnt)
      $(elem).find('.free-detail').text('詳細' + cnt)
      cnt++
  )
