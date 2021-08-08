// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require moment/ja.js
//= require tempusdominus-bootstrap-4.js

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

   $(document).on('turbolinks:load', function () {
    $('#limit').datetimepicker({
      format: 'YYYY-MM-DD'
    });
  });
  
//   $('#myImage').on('change', function (e) {
//     var reader = new FileReader();
//     reader.onload = function (e) {
//         $("#preview").attr('src', e.target.result);
//     }
//     reader.readAsDataURL(e.target.files[0]);
// });

function setImage(target) {
        var reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById("preview").setAttribute('src', e.target.result);
        }
        reader.readAsDataURL(target.files[0]);
    };
