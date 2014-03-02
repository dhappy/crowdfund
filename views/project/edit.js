Crowdfund.EditProjectView = Ember.TextField.extend( {
    didInsertElement: function() {
        this.$().focus()
    }
} )

Ember.Handlebars.helper( 'edit-project', Crowdfund.EditProjectView )
