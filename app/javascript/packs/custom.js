$(document).on("turbolinks:load",function(){
  setTimeout(function(){
    $('.alert', '.flash', '.flash.notice-modal').fadeOut('slow');
  }, 6000)

  const districts_demand = $('#demand_district_id').html()
  $(document).on('change', '#demand_province_id', function(){
    const province = $('#demand_province_id :selected').text()
    const options = $(districts_demand).filter('optgroup[label="' + province + '"]').html()

    if (options){
      $('#demand_district_id').html(options)
      $('#demand_district_id').parent().show()
    }
    else {
      $('#demand_district_id').empty()
    }
  })

  const districts_user = $('#user_teacher_attributes_district_id').html()
  $(document).on('change', '#user_teacher_attributes_province_id', function(){
    const province = $('#user_teacher_attributes_province_id :selected').text()
    const options = $(districts_user).filter('optgroup[label="' + province + '"]').html()

    if (options){
      $('#user_teacher_attributes_district_id').html(options)
      $('#user_teacher_attributes_district_id').parent().show()
    }
    else {
      $('#user_teacher_attributes_district_id').empty()
    }
  })

  const districts_search = $('#q_district_id_eq').html()
  $(document).on('change', '#q_province_id_eq', function(){
    const province = $('#q_province_id_eq :selected').text()
    const options = $(districts_search).filter('optgroup[label="' + province + '"]').html()

    if (options){
      $('#q_district_id_eq').html(options)
      $('#q_district_id_eq').parent().show()
    }
    else {
      $('#q_district_id_eq').empty()
    }
  })

  const districts_teacher = $('#teacher_district_id').html()
  $(document).on('change', '#teacher_province_id', function(){
    const province = $('#teacher_province_id :selected').text()
    const options = $(districts_teacher).filter('optgroup[label="' + province + '"]').html()

    if (options){
      $('#teacher_district_id').html(options)
      $('#teacher_district_id').parent().show()
    }
    else {
      $('#teacher_district_id').empty()
    }
  })

  $(document).on('click', 'tr[data-link]', function(){
    window.location = $(this).data('link')
  })

  if($('.role input:checked').val() == "teacher") {
    $('.form-teacher').css("display", "block")
  }
  else {
    $('.form-teacher').css("display", "none")
  }

  $(document).on('change', '.role input', function(){

    if($('.role input:checked').val() == "teacher") {
      $('.form-teacher').css("display", "block")
    }
    else {
      $('.form-teacher').css("display", "none")
    }
  })

  $(document).on('change', '.upload-img', function(){
    if (this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(this.files[0]);
    }
  })

  $(document).on('change', '.upload-diploma', function(){
    if (this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        $('#diploma_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(this.files[0]);
    }
  })

  $('select#teacher_province_id').select2()
  $('select#teacher_district_id').select2()
  $('select#demand_province_id').select2()
  $('select#demand_district_id').select2()
  $('select#user_teacher_attributes_province_id').select2()
  $('select#user_teacher_attributes_district_id').select2()
  $('select#q_district_id_eq').select2()
  $('select#q_province_id_eq').select2()

  $(document).on('click', 'button.cancle', function(){
    $('#myModal').css("display", "none")
  })
});
