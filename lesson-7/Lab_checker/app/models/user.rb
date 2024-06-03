class User < ApplicationRecord
	has_many :lab_reports

	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 120, minimum: 3 }
	validates :first_name, presence: true, length: { maximum: 120, minimum: 3 }
	validates :last_name, presence: true, length: { maximum: 120, minimum: 3 }
end
