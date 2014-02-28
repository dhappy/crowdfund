Crowdfund.ProjectsController = Ember.ArrayController.extend( {
    actions: {
        createProject: function() {
            var name = this.get('projName');

            if( ! name.trim() ) {
                return
            }

            var project = this.store.createRecord( 'project', {
                name: name,
                isCompleted: false
            } )

            this.set( 'projName', '' ) // clear field

            project.save()
        }
    },

    remaining: function() {
        return this.filterBy( 'isCompleted', false ).get( 'length' )
    }.property( '@each.isCompleted' ),

    inflection: function() {
        var remaining = this.get( 'remaining' )
        return remaining === 1 ? 'project' : 'projects'
    }.property( 'remaining' )
} )
