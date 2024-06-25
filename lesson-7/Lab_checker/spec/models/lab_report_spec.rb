require 'rails_helper'

RSpec.describe LabReport, type: :model do
  it 'belong_to user' do
    should belong_to :user
  end

  it 'validates grade' do
    should validate_presence_of :grade
  end

  it 'validates title' do
    should validate_presence_of :title
  end

  it 'validates description' do
    should validate_presence_of :description
  end
end
