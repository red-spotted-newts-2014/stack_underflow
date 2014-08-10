class Question < ActiveRecord::Base
  make_voteable
  has_many :answers, dependent: :destroy
  has_many :responses, as: :responsable
  has_many :votes, as: :votable
  has_many :question_tags
  has_many :tags, through: :question_tags
  belongs_to :user

  accepts_nested_attributes_for :tags, :allow_destroy => :true  ,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  validates :title, presence: true,
    length: { minimum: 5 }
  validates :body, presence: true,
    length: { minimum: 5 }
  validates :title, uniqueness: true

  def self.unanswered
    self.all.select { |x| p x if x.answers.length == 0 }
  end

end
