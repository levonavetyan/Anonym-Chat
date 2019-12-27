// $(function() {
//   // alert('ad')
  
  


//   $('.send-button').on('click',()=>{
//     let valu = $('.chat-input').val();
    
//     $( ".chat_text_area" ).append("<p class='message-content'>"+valu+"</p>");

//     // $('.chat-input').val(''); 
//   })
// });

$(function() {
  $('#new_room_message').on('ajax:success', function(a, b,c ) {
    $(this).find('input[type="text"]').val('');
  });
});