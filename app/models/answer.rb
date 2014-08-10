class Answer < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :question
  has_many :responses, as: :responsable
  has_many :votes, as: :votable

  validates :body, presence: true
end
