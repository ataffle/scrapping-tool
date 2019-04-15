class Scrap < ApplicationRecord
  validates :scrap_url, presence: true
  has_many :properties
end
