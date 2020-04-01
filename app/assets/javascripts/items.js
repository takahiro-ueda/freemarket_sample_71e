$(document).on('turbolinks:load', ()=> {
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-box">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][image]"
                    id="item_item_images_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  let fileIndex = [1,2,3,];
  
  lastIndex = $('.js-box:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();

  $('#image-form').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {  
      $('#previews').append(buildImg(targetIndex, blobUrl));
      if ($('.js-file').length < 4) $('#image-form').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    }
  });

  $('#image-form').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // if ($('.js-file').length == 0) $('#image-form').append(buildFileField(fileIndex[0]));

    const targetIndex = $(this).parent().data('index')
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(`img[data-index="${targetIndex}"]`).remove();
    $('#image-form').append(buildFileField(fileIndex[targetIndex]));
  });
});
