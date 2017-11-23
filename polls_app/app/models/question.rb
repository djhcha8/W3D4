class Question < ApplicationRecord
  validates :poll_id, presence: true, uniqueness: true
  
  belong_to :poll
  
  has_many :answer_choices, {
    foreign_key: :question_id,
    class_name: 'AnswerChoice'
  }
  
  has_many :responses, {
    through: :answer_choices,
    source: :responses
  }
  
  
  
  def results_n_1
    result = {}
    
    self.answer_choices.each do |f|
      result[f.text] = f.responses.length
    end
    
    result    
  end
  
  

  
  
  def results_include
    result = {}
    
    self.answer_choices.includes(:responses).each do |f|
      result[f.text] = f.responses.length
    end
    
    result
  end
end
