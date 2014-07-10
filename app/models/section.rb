class Section < ActiveRecord::Base

	belongs_to :page
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"

	acts_as_list :scope => :page

	after_save :touch_subject_and_page

	CONTENT_TYPES = ['text', 'HTML']

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_inclusion_of :content_type, :in => CONTENT_TYPES,
	  :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
	validates_presence_of :content

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("sections.position ASC") }
	scope :newest_first, lambda { order("sections.created_at DESC") }
	scope :sorted_by_subject, lambda { order("sections.page_id ASC") }


	def self.search(search)
  	@section = Section.where('name like ? OR content like ?', "%#{search}%", "%#{search}%")

 	end



  private

  def touch_subject_and_page
  	page.subject.touch
  	page.touch
  end

end
