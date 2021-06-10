require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント新規投稿' do
    context '投稿できる時' do
      it 'textが正しく入力されている場合投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context '投稿できない時' do
      it 'textが空の場合投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include "Text can't be blank"
      end
      it 'userが紐づいていない場合投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'User must exist'
      end
      it 'postが紐づいていない場合投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Post must exist'
      end
    end
  end
end
