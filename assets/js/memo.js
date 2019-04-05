function save_draft(e){
    e.preventDefault()

    console.log("Work in progress..")
    var form_data = $("#memo-form").serialize()
    console.log(form_data)
    var post_url = $("#memo-form").attr("action")
    console.log(post_url)
    // $("#memo-form").submit(function( event ) {
    //     event.preventDefault()
    //     var post_url = $(this).attr("action")
    //     console.log(post_url)
    // });

    // var form_data = $(this).serialize();   // Encode form elements for submission
    
    // $.post(post_url, form_data, function(response){

    //     $(".cart-count").text(response.cart_count)
    // });
}

var memo = {
    init: function() {
        $(function() {
            $("#save_for_later").on('click', save_draft)
        })
        $(function() {
            $(".cart-form").on('submit', save_draft)
        })
    }
}

export default memo