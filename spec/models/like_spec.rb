require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe do
    context 'いいねできる時' do
      it '正しく値が入力されている場合いいねできる' do
        expect(@like).to be_valid
      end
    end
    context 'いいねできない時' do
      it 'userが紐づいていない場合いいねできない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "User must exist"
      end
      it 'postが紐づいていない場合いいねできない' do
        @like.post = nil
        @like.valid?
        expect(@like.errors.full_messages).to include "Post must exist"
      end
    end
  end
end
