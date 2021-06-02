require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '投稿できる時' do
      it 'title,text,category_idが正しく入力されている場合登録できる' do
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
      it 'titleが40字より多い場合登録できない' do
        @post.title =  Faker::Name.initials(number: 41)
        @post.valid?
        expect(@post.errors.full_messages).to include "Title is too long (maximum is 40 characters)"
      end
    end
  end
end