# == Schema Information
#
# Table name: questions
#
#  id                 :integer          not null, primary key
#  question           :text
#  quiz_definition_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Question < ActiveRecord::Base
  
  belongs_to :quiz_definition
  has_many :question_options
  attr_accessible :question
  
  def correct_answer()
    return self.question_options.where(is_correct: 1).first    
  end
  
end
