class SectionEdit < ActiveRecord::Base

	belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
	belongs_to :section

	def next
    self.class.where("id > ?", id).order("id ASC").first
  end

  def prev
    self.class.where("id < ?", id).order("id DESC").first
  end

end
