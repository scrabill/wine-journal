class Bottle < ActiveRecord::Base
  belongs_to :user
  validates :name, :brand, :variety, :description, :note, presence: true
end
