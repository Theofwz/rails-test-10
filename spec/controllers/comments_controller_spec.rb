require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let!(:user)  { create(:user, email: 'thao@example.com') }

  before { @request.env['devise.mapping'] = Devise.mappings[:user] }
  before { sign_in user }

  describe '#index' do
    def do_request
      get :index
    end
    
    let!(:comment_parent) { create(:comment, parent_id: nil) }

    it 'show comment parent' do
      do_request

      expect(assigns(:comment_parent).count).to eq 1
    end
  end

  describe '#create' do
    def do_request
      xhr :post, 'create', comment: comment.attributes
    end

    let(:comment)    { build(:comment)  }

    it 'save a comment' do
      expect{ do_request }.to change(Comment, :count).by(1)
    end
  end
end