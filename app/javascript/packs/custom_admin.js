$(document).on("turbolinks:load",function(){
  var t = $('#example1').DataTable( {
    "columnDefs": [ {
      "searchable": false,
      "orderable": false,
      "targets": 0
    } ]
  } );

  t.on( 'order.dt search.dt', function () {
    t.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
      cell.innerHTML = i+1;
    } );
  } ).draw();

  setTimeout(function(){
    $('.alert', '.flash', '.flash.notice-modal').fadeOut('slow');
  }, 6000)

  $(document).on('click', 'tr[data-link]', function(){
    window.location = $(this).data('link')
  })
});
