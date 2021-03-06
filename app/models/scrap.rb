class Scrap < ApplicationRecord
  validates :scrap_url, presence: true, :url => true
  has_many :properties, dependent: :destroy
  belongs_to :user
end
