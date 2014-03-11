# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
org = Organization.create name: 'Department of Happiness'
projs = [ { owner: 'dhappy', github_name: 'crowdfund' },
          { owner: 'dhappy', github_name: 'tour' },
          { owner: 'OneAcreCafe', github_name: 'volunteers' },
          { owner: 'dhappy', github_name: 'housing' },
          { owner: 'OneAcreCafe', github_name: 'sales' },
          { owner: 'dhappy', github_name: 'liquid_vote' },
          { owner: 'OneAcreCafe', github_name: 'costs' },
          { owner: 'wholcomb', github_name: 'mimis' } ]
projs.each do |proj|
  project = Project.load_from_github proj
  org.projects << project
  puts "Added: #{project.name}"
end
