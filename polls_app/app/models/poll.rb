# == Schema Information
#
# Table name: polls
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
  validates :title, presence: true 
  belongs_to :user,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :questions,
    foreign_key: :poll_id,
    class_name: "Question"
end
