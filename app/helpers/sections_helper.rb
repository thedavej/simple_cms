module SectionsHelper

	def check_first_page
		if @page.id == @page.subject.pages.first.id
			return " disabled"
		else
			return ""
		end
	end

	def check_last_page
		if @page.id == @page.subject.pages.last.id
			return " disabled"
		else
			return ""
		end
	end


end
