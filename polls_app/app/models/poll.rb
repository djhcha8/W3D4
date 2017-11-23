class Poll < ApplicationRecord
  validates :user_id, presence: true
  
  belong_to :author, {
    foreign_key: :user_id,
    class_name: 'User'
  }
  
  has_many :questions
end
