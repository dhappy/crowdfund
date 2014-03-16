require 'open-uri'

class Project < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_many :assignments
  has_many :organizations, through: :assignments
  has_many :issues

  def self.load_from_github params
    info = JSON.parse open("https://api.github.com/repos/%s/%s" % [params[:owner], params[:github_name]]).read

    project = Project.find_or_create_by id: info['id']

    project.github_name = params[:github_name]
    project.name = params[:github_name].gsub(/_/, ' ').titleize
    project.description = info['description']
    project.owner = User.find_or_create_by github_name: params[:owner]

    project.save

    issues = JSON.parse open("https://api.github.com/repos/%s/%s/issues" % [params[:owner], params[:github_name]]).read

    issues.each do |issue_res|
      issue = Issue.find_or_create_by id: issue_res['id']
      issue.name = issue_res['title']
      issue.url = issue_res['html_url']
      issue.milestone = Milestone.find_or_create_by name: issue_res.try(:[], 'milestone').try(:[], 'title')
      issue.description = issue_res['body']
      issue.project = project
      issue.save
    end

    project
  end
end
