module MyTablesHelper

	def tableTuples table_id
		return Tuple.where(my_table_id: table_id)
	end

end
