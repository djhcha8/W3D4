class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  
  has_many :author_polls, {
    foreign_key: :user_id,
    class_name: 'Poll'
  }
  has_many :responses, {
    foreign_key: :user_id,
    class_name: 'Response'
  }
end
