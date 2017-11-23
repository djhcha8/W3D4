class Response < ApplicationRecord
  validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response
  
  belong_to :respondent, {
    foreign_key: :user_id,
    class_name: 'User'
  }
  
  belong_to :answer_choice {
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'
  }
  
  has_one :question, {
    through: :answer_choice,
    source: :question
  }
    
  
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    sibling_responses.exists?(respondent_id: self.respondent_id)
  end
  
  def not_duplicate_response
    if respondenet_already_answered?
      errors[:respondent_id] << "Already voted!!"
    end
  end
end
