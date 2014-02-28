Crowdfund.Project = DS.Model.extend( {
    name: DS.attr( 'string' ),
    isCompleted: DS.attr( 'boolean' )
} )

Crowdfund.Project.FIXTURES = [
    {
        id: 1,
        name: 'P#1',
        isCompleted: true
    },
    {
        id: 2,
        name: 'P#2',
        isCompleted: false
    },
    {
        id: 3,
        name: 'P#3',
        isCompleted: false
    }
]
