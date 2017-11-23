class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  
  belong_to :respondent, {
    foreign_key: :user_id,
    class_name: 'User'
  }
  
  belong_to :answer_choice {
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'
  }
end
