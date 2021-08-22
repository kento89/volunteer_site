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
//= require rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require moment
//= require moment/ja.js
//= require tempusdominus-bootstrap-4.js

//= require activestorage
//= require turbolinks
//= require_tree .


   $(document).on('turbolinks:load', function () {
    $('#limit').datetimepicker({
      format: 'YYYY-MM-DD'
    });
  });

    let key = 0;
    function loadImage(obj) {
    for (i = 0; i < obj.files.length; i++) {
        var fileReader = new FileReader();
        fileReader.onload = (function (e) {
            var field = document.getElementById("imgPreviewField");
            var figure = document.createElement("figure");
            var rmBtn = document.createElement("input");
            var img = new Image();
            img.src = e.target.result;
            rmBtn.type = "button";
            rmBtn.name = key;
            rmBtn.value = "削除";
            rmBtn.onclick = (function () {
                var element = document.getElementById("img-" + String(rmBtn.name)).remove();
            });
            figure.setAttribute("id", "img-" + key);
            figure.appendChild(img);
            figure.appendChild(rmBtn)
            field.appendChild(figure);
            key++;
        });
        fileReader.readAsDataURL(obj.files[i]);
    }
}

// 写真スライド
$(document).on('turbolinks:load', function(){
    $('#slider').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 2000,
    });
});


$(document).on('tubolinks:load',function(){
  $('#go_chat').on('click', function(){
    window.open('room_path(@room)','subwin','width=300,height=300');
    return false;
  });
});


// チャット画面の表示非表示を切り替える
$(document).on('turbolinks:load', function() {
  $(document).on('click', '#btnInvisible', function(){
    let chats = $('#chatRoom').attr('class');
    console.log(chats);
    if(chats=='open-window off'){
      $('#chatRoom').removeClass('off');
    }else{
      $('#chatRoom').addClass('off');
    }
  });
  
});

