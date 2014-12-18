class AdminUser < ActiveRecord::Base
  # To Configure a different table name:
  # self.table_name = 'admin_users'
  has_and_belongs_to_many :pages
  has_many :section_edits
  has_many :sections, through: :section_edits

  BAD_USERNAMES = ['bacon', 'lettuce', 'tomato']

  validates :username, presence: true,
                       length: { maximum: 25 },
                       uniqueness: true
  # validates_presence_of :username
  # validates_length_of :username, maximum: 25 
  # validates_uniqueness_of :username
  validate :username_not_bad
  # validate :no_new_users_on_saturday, on: :create

  def username_not_bad
    if BAD_USERNAMES.include?(username)
      errors.add(:username, 'has been restricted from use')
    end
  end

  def no_new_users_on_saturday
    if Time.now.wday == 6
      errors[:base] << 'No new users on Saturdays.'
    end
  end
end
