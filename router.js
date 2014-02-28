Crowdfund.Router.map( function() {
    this.resource( 'projects', { path: '/' } )
} )

Crowdfund.ProjectsRoute = Ember.Route.extend( {
    model: function() {
        return this.store.find( 'project' )
    }
} )
