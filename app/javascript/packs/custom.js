$(document).ready(function(){
  setTimeout(function(){
    $('.alert, .flash').remove()
  }, 5000)

  $(document).on('change', '.upload-img', function(){
    if (input.files && input.files[0]) {
      var reader = new FileReader()

      reader.onload = function(e) {
        $('#img_prev').attr('src', e.target.result)
      }

      reader.readAsDataURL(input.files[0])
    }
  })

  $(document).on('change', '#demand_province_id', function(){
    const districts = $('#demand_district_id').html()
    const province = $('#demand_province_id :selected').text()
    const options = $(districts).filter('optgroup[label="' + province + '"]').html()

    if (options){
      $('#demand_district_id').html(options)
      $('#demand_district_id').parent().show()
    }
    else {
      $('#demand_district_id').empty()
    }
  })

  $(document).on('change', '#user_teacher_attributes_province_id', function(){
    const districts = $('#user_teacher_attributes_district_id').html()
    const province = $('#user_teacher_attributes_province_id :selected').text()
    const options = $(districts).filter('optgroup[label="' + province + '"]').html()

    if (options){
      $('#user_teacher_attributes_district_id').html(options)
      $('#user_teacher_attributes_district_id').parent().show()
    }
    else {
      $('#user_teacher_attributes_district_id').empty()
    }
  })

    $(document).on('click', 'tr[data-link]', function(){
    window.location = $(this).data('link')
  })
});
