module ApplicationHelper
	def getProject id
		project = MyProject.find(id)
		return project
	end

	def count_tables project_id
		return MyTable.where(my_project_id: project_id).count
	end

	def count_tuples project_id
		@tuples = 0
		@tables = MyTable.where(my_project_id: project_id)
		@tables.each do |t|
			@tuples += Tuple.where(my_table_id: t.id).count
		end
		return @tuples
	end
end
