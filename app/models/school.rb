class School < ApplicationRecord
  # Validations
  validates_presence_of :name, :address, :principal, :capacity, :private_school
  validates_uniqueness_of :name
  validates :capacity, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000}

  
  # Associations
  has_many :students, dependent: :destroy
  accepts_nested_attributes_for :students
end

