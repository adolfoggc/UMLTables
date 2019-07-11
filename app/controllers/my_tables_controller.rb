class MyTablesController < ApplicationController
  before_action :set_my_table, only: [:show, :edit, :update, :destroy]

  # GET /my_tables
  # GET /my_tables.json
  def index
    @my_tables = MyTable.all
  end

  # GET /my_tables/1
  # GET /my_tables/1.json
  def show
    @tuples = Tuple.where(my_table_id: @my_table.id)
  end

  # GET /my_tables/new
  def new
    @my_table = MyTable.new
  end

  # GET /my_tables/1/edit
  def edit
  end

  # POST /my_tables
  # POST /my_tables.json
  def create
    @my_table = MyTable.new(my_table_params)

    respond_to do |format|
      if @my_table.save
        if params[:commit] == 'Adicionar Tabela'
          format.html { redirect_to my_project_path(@my_table.my_project_id), notice: 'My table was successfully created.' }
        else
          format.html { redirect_to @my_table, notice: 'My table was successfully created.' }
        end
        format.json { render :show, status: :created, location: @my_table }
      else
        format.html { render :new }
        format.json { render json: @my_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_tables/1
  # PATCH/PUT /my_tables/1.json
  def update
    respond_to do |format|
      if @my_table.update(my_table_params)
        format.html { redirect_to table_path(@my_table.id), notice: 'My table was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_table }
      else
        format.html { render :edit }
        format.json { render json: @my_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_tables/1
  # DELETE /my_tables/1.json
  def destroy
    @project_id = @my_table.my_project_id
    destroy_tuples @my_table.id
    @my_table.destroy
    respond_to do |format|
      format.html { redirect_to my_project_path(@project_id), notice: 'Tabela apagada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_table
      @my_table = MyTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def my_table_params
      params.require(:my_table).permit(:name, :my_project_id)
    end
end
