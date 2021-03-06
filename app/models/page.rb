class Page < ActiveRecord::Base

	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many :editors, :class_name => "AdminUser"

	acts_as_list :scope => :subject

	before_validation :set_default_permalink
	after_save :touch_subject
	after_destroy :delete_related_sections

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_presence_of :permalink
	validates_length_of :permalink, :within => 3..255
	#use presence_of with length_of to disallow spaces
	validates_uniqueness_of :permalink
	# for unique values by subject use ":scope => :subject_id"

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("pages.position ASC") }
	scope :sub_sorted, lambda { order("pages.subject_id ASC") }
	scope :newest_first, lambda { order("pages.created_at DESC") }

  def next
    subject.pages.where("id > ?", id).order("id ASC").first
  end

  def prev
    subject.pages.where("id < ?", id).order("id DESC").first
  end

  def next_subj
    if subject.next
      subject.next.pages.first
    end
  end

  def prev_subj
    if subject.prev
      subject.prev.pages.first
    end
  end

  private

  def set_default_permalink
  	if permalink.blank?
  		self.permalink = "#{subject.name}-#{name.parameterize}"
  	end
  end

  def touch_subject
  	# touch is similar to:
  	# subject.updateattribute(:updated_at, Time.now)
  	subject.touch
  end

  def delete_related_sections
  	# self.section.each do |secetion|
  		# Or perhaps instead of destroy, we can
  		# move them to another page?
  		# section.destroy
  end

end
