class Question < ApplicationRecord
  validates :poll_id, presence: true, uniqueness: true
  
  belong_to :poll
  
  has_many :answer_choices, {
    foreign_key: :question_id,
    class_name: 'AnswerChoice'
  }
end
