class Post < ApplicationRecord
  validates :body, presence: true
  belongs_to :member
end
