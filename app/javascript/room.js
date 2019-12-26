$(function() {
  // alert('ad')
  
  


  $('.send-button').on('click',()=>{
    let valu = $('.chat-input').val();
    
    $( ".chat_text_area" ).append("<p class='message-content'>"+valu+"</p>");

    // $('.chat-input').val(''); 
  })
});

