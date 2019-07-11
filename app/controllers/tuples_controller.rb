class TuplesController < ApplicationController
  before_action :set_tuple, only: [:show, :edit, :update, :destroy]

  # GET /tuples
  # GET /tuples.json
  def index
    @tuples = Tuple.all
  end

  # GET /tuples/1
  # GET /tuples/1.json
  def show
  end

  # GET /tuples/new
  def new
    @tuple = Tuple.new
  end

  # GET /tuples/1/edit
  def edit
  end

  # POST /tuples
  # POST /tuples.json
  def create
    @tuple = Tuple.new(tuple_params)

    respond_to do |format|
      if @tuple.save
        format.html { redirect_to table_path(@tuple.my_table.my_project_id, @tuple.my_table_id), notice: 'Tuple was successfully created.' }
        format.json { render :show, status: :created, location: @tuple }
      else
        format.html { render :new }
        format.json { render json: @tuple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuples/1
  # PATCH/PUT /tuples/1.json
  def update
    respond_to do |format|
      if @tuple.update(tuple_params)
        format.html { redirect_to table_path(@tuple.my_table.my_project_id, @tuple.my_table_id), notice: 'Tuple was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuple }
      else
        format.html { render :edit }
        format.json { render json: @tuple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuples/1
  # DELETE /tuples/1.json
  def destroy
    @table = MyTable.find(@tuple.my_table_id)
    @tuple.destroy
    respond_to do |format|
      format.html { redirect_to table_path(@table.my_project_id, @table.id), notice: 'Tuple was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuple
      @tuple = Tuple.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuple_params
      params.require(:tuple).permit(:name, :data, :my_table_id)
    end
end
