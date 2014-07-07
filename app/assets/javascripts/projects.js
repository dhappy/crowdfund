$( function() {
    $('.estimate input').on( 'blur', function() {
        $(this).parents( 'form' ).ajaxSubmit()
    } )
} )
