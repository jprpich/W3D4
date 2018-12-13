# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'byebug'
class Response < ApplicationRecord
  validate :not_duplicate_response, :not_answered_by_author

  def not_answered_by_author
    if not_answered_by_author_helper
      errors[:author] << "Error. Question can't be answered by author."
    end
  end

  def not_answered_by_author_helper
    user = self.answer_choice.question.poll.user
    user.id == user_id
  end

  def not_duplicate_response
    debugger
    if respondent_already_answered?
      errors[:potato] << 'Error. Respondant already answered.'
    end
  end

  def respondent_already_answered?
    # sibs = sibling_responses
    # sibs.any?{|sib| sib.exists?(user_id: self.id)}
    Response.exists?(sibling_responses)
  end

  def sibling_responses 
    self.question.responses.where.not(id: self.id)
  end

  belongs_to :user, 
    foreign_key: :user_id, 
    class_name: 'User'
  
  belongs_to :answer_choice, 
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  has_one :question,
    through: :answer_choice,
    source: :question 

  
end
