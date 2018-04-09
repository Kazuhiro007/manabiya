class Lesson < ApplicationRecord
  belongs_to :user

  has_many :favorites
  has_many :participates
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :participate_users, through: :participates, source: 'user'
end
