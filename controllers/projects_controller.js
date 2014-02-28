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
    }
})
