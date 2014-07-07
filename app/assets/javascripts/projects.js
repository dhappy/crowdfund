$( function() {
    $('.new_bid input').on( 'blur', function() {
        $(this).parents( 'form' ).ajaxSubmit()
    } )
} )
