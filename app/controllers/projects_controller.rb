class ProjectsController < ApplicationController
  
  before_filter :authenticate,    :only => [:new]
  before_filter :authorized_user, :only => [:edit, :destroy]
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:success] = "Project was successfully created."
      redirect_to root_path
    else
      flash[:error] = "Failed to make project."
      render 'new'
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project
      flash[:success] = "Project was successfully updated."
    else
      render 'edit'
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
  end
  
  # USER MUST BE SIGNED IN
  # IN ORDER TO CREATE PROJECT
  def authenticate
    if !signed_in?
      flash[:error] = "You must be signed in to create a project."
      redirect_to root_path
    end
  end
  
  # USER MUST BE SIGNED IN
  # IN ORDER TO EDIT PROJECT
  def authorized_user
    @project = current_user.projects.find_by_id(params[:id])
    if @project.nil?
      flash[:error] = "You can only edit your own projects."
      redirect_to root_path
    end
  end
end
