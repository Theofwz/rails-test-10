require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to :comment }
    it { is_expected.to belong_to :user }
  end
end