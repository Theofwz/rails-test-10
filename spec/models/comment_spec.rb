require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :user_id }
  end

  describe 'Associations' do
    it { is_expected.to have_many :replies }
    it { is_expected.to have_many :likes }
    
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :parent }
  end
end