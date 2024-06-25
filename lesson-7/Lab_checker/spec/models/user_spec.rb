require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates last_name' do
    should validate_presence_of :last_name
  end

  it 'validates first_name' do
    should validate_presence_of :first_name
  end

  it 'validates email' do
    should validate_presence_of :email
  end

  it 'has_many lab_reports' do
    should have_many :lab_reports
  end

  # it 'has_many lab_reports' do
  #   let(name :user1) { create :user }
  # end
end
