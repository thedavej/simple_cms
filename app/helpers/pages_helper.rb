module PagesHelper

	def check_first_subject
		if @subject.id == @subject.class.first.id
			return " disabled"
		else
			return ""
		end
	end

	def check_last_subject
		if @subject.id == @subject.class.last.id
			return " disabled"
		else
			return ""
		end
	end

	def check_all_subjects
		if @all_pages
			return " disabled"
		else
			return ""
		end
	end

end
