# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
org = Organization.create name: 'Department of Happiness'
projs = [ { owner: 'OneAcreCafe', github_name: 'volunteers' } ]
projs.each do |proj|
  project = Project.load_from_github proj
  org.projects << project
  puts "Added: #{project.name}"
end
