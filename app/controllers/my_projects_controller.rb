class MyProjectsController < ApplicationController
  before_action :set_my_project, only: [:show, :edit, :update, :destroy]

  # GET /my_projects
  # GET /my_projects.json
  def index
    @my_projects = MyProject.all
  end

  # GET /my_projects/1
  # GET /my_projects/1.json
  def show
    @tables = MyTable.where(my_project_id: @my_project)
  end

  # GET /my_projects/new
  def new
    @my_project = MyProject.new
  end

  # GET /my_projects/1/edit
  def edit
  end

  # POST /my_projects
  # POST /my_projects.json
  def create
    @my_project = MyProject.new(my_project_params)

    respond_to do |format|
      if @my_project.save
        format.html { redirect_to my_projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @my_project }
      else
        format.html { render :new }
        format.json { render json: @my_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_projects/1
  # PATCH/PUT /my_projects/1.json
  def update
    respond_to do |format|
      if @my_project.update(my_project_params)
        format.html { redirect_to my_projects_path, notice: 'My project was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_project }
      else
        format.html { render :edit }
        format.json { render json: @my_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_projects/1
  # DELETE /my_projects/1.json
  def destroy
    destroy_tables @my_project.id
    @my_project.destroy
    respond_to do |format|
      format.html { redirect_to my_projects_url, notice: 'My project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_project
      @my_project = MyProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_project_params
      params.require(:my_project).permit(:name)
    end

    
end
