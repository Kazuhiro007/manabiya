class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: true

  has_many :lessons
  has_many :favorites
  has_many :favorite_lessons, through: :favorites, source: 'lesson'
  has_many :participates
  has_many :participate_lessons, through: :participates, source: 'lesson'

  has_secure_password
end
