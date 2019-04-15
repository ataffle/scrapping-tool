class Property < ApplicationRecord
  # validates :ref, uniqueness: true
  belongs_to :scrap
end
