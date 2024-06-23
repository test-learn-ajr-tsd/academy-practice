class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	has_many :lab_reports

	validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 120, minimum: 3 }
	validates :first_name, presence: true, length: { maximum: 120 } #, minimum: 3 
	validates :last_name, presence: true, length: { maximum: 120 }
end
