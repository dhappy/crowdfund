Crowdfund.ProjectController = Ember.ObjectController.extend( {
    actions: {
        editProject: function() {
            this.set( 'isEditing', true )
        },
        acceptChanges: function() {
            this.set( 'isEditing', false )

            if( Ember.isEmpty( this.get( 'model.title' ) ) ) {
                this.send( 'removeProject' )
            } else {
                this.get( 'model' ).save()
            }
        },
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
