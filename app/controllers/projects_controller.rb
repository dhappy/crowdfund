require 'open-uri'
require 'pp'

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    params = project_params

    params[:name] ||= params[:github_name].gsub(/_/, ' ').titleize
    
    info = JSON.parse open("https://api.github.com/repos/%s/%s" % [params[:owner], params[:github_name]]).read

    params[:description] = info['description']

    issues = JSON.parse open("https://api.github.com/repos/%s/%s/issues" % [params[:owner], params[:github_name]]).read

    issues.each do |issue_res|
      issue = Issue.find_or_create_by id: issue_res['id']
      issue.name = issue_res['title']
      issue.milestone = Milestone.find_or_create_by name: issue_res.try(:[], 'milestone').try(:[], 'title')
      issue.description = issue_res['body']
      pp issue
    end

    params[:owner] = User.find_or_create_by github_name: params[:owner]

    @project = Project.new params

    respond_to do |format|
      if false and @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:github_name, :name, :owner)
    end
end
