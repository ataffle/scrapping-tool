class Scrap < ApplicationRecord
  validates :scrap_url, presence: true, :scrap_url => true
  has_many :properties
  belongs_to :user
end
