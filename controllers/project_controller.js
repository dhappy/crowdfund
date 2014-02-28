Crowdfund.ProjectController = Ember.ObjectController.extend( {
    actions: {
        editProject: function() {
            this.set( 'isEditing', true )
        }
    },

    isEditing: false,

    isCompleted: function( key, value ) {
        var model = this.get( 'model' )

        if( value === undefined ) { // getter
            return model.get( 'isCompleted' )
        } else {
            model.set( 'isCompleted', value )
            model.save()
            return value
        }
    }.property( 'model.isCompleted' )
} )
