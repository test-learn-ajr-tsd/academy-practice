class LabReport < ApplicationRecord
	belongs_to :user

	validates :title, presence: true, length: { maximum: 120 } #minimum: 3
	validates :description, presence: true
	validates :grade, presence: true, length: { maximum: 10 }
end
