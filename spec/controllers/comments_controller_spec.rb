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
      xhr :post, 'create', id: comment.id, reply: reply.attributes
    end

    let(:reply)     { build(:reply) }
    let(:comment)   { create(:comment, user: user) }

    it 'save a item' do
      expect{ do_request }.to change(Reply, :count).by(1)
    end
  end
end