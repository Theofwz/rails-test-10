require 'rails_helper'

describe Comments::LikesController, type: :controller do
  let!(:user)  { create(:user) }

  before { @request.env['devise.mapping'] = Devise.mappings[:user] }
  before { sign_in user }

  describe '#create' do
    def do_request
      xhr :post, 'create', comment_id: comment.id, like: like.attributes
    end

    let(:like)         { build(:like)  }
    let(:comment)      { create(:comment)  }

    it 'like a comment' do
      expect{ do_request }.to change(Like, :count).by(1)
    end
  end

  describe '#destroy' do
    def do_request
      xhr :delete, 'destroy', comment_id: comment.id, id: like.id
    end
    

    let!(:like)         { create(:like)  }
    let!(:comment)      { create(:comment)  }

    it 'like a comment' do
      expect{ do_request }.to change(Like, :count).by(0)
    end
  end
end