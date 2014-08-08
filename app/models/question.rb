class Question < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	has_many :responses, as: :responsable
	has_many :votes, as: :votable
	has_many :question_tags
	has_many :tags, through: :question_tags
	belongs_to :user

  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :body, presence: true,
                    length: { minimum: 5 }  
  validates :title, uniqueness: true
end