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
});
