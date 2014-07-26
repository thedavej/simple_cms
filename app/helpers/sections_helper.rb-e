module SectionsHelper

	def check_first_page
		if (@page.id == @page.class.first.id) || @all_sect
			return " disabled"
		else
			return ""
		end
	end

	def check_last_page
		if (@page.id == @page.class.last.id) || @all_sect
			return " disabled"
		else
			return ""
		end
	end

	def check_all_sections
		if @all_sect
			return " disabled"
		else
			return ""
		end
	end


end
