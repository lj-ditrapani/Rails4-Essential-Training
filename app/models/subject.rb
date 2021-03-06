class Subject < ActiveRecord::Base
  has_many :pages

  validates_presence_of :name
  validates_length_of :name, maximum: 80

  scope :visible, -> { where visible: true }
  scope :invisible, -> { where visible: false }
  scope :sorted, -> { order 'subjects.position ASC' }
  scope :newest_first, -> { order 'subjects.created_at ASC' }
  scope :search, ->(query) { where ['name LIKE ?', "%#{query}%"] }
end
