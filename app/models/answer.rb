class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :responses, as: :responsable
  has_many :votes, as: :votable

  validates :body, presence: true
end