class Response < ActiveRecord::Base
  belongs_to :responsable

  validates :responsable_id, presence: true
end
