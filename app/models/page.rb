class Page < ActiveRecord::Base
  belongs_to :subject
  # has_and_belongs_to_many :admin_users
  has_and_belongs_to_many :editors, class_name: 'AdminUser'
  has_many :sections

  before_validation :add_default_permalink
  after_save :touch_subject

  validates_presence_of :name
  validates_length_of :name, maximum: 80
  validates_presence_of :permalink
  validates_length_of :permalink, within: 3..255
  validates_uniqueness_of :permalink

  scope :visible, -> { where visible: true }
  scope :invisible, -> { where visible: false }
  scope :sorted, -> { order('pages.position ASC') }
  scope :newest_first, -> { order 'pages.created_at ASC' }

  private

  def add_default_permalink
    if permalink.blank?
      self.permalink = 3000
    end
  end

  def touch_subject
    subject.touch
  end
end
