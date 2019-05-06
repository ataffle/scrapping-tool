class Property < ApplicationRecord
  validates :ref, uniqueness: { scope: :date }
  belongs_to :scrap
end
