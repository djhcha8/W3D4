class AnswerChoice < ApplicationRecord
  validates :question_id, presence: true
end
