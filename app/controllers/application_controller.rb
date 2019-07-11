class ApplicationController < ActionController::Base
	private
		def destroy_tuples table_id
      @tuples = Tuple.where(my_table_id: table_id)
      @tuples.each do |t|
        t.destroy
      end
    end

    def destroy_tables project_id
      @tables = MyTable.where(my_project_id: project_id)
      @tables.each do |t|
        destroy_tuples t.id
        t.destroy
      end
    end
end
