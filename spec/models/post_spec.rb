require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '投稿できる時' do
      it 'title,text,category_id,user_idが存在すれば登録できる' do
        expect(@post).to be_valid
      end
    end
    context '投稿できない時' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include "Title can't be blank"
      end
      it 'textが空では登録できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include "Text can't be blank"
      end
      it 'category_idが1の場合登録できない' do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include "Category must be other than 1"
      end
      it 'userが紐づいていない場合登録できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include "User must exist"
      end
    end
  end
end