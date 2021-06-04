require 'rails_helper'

RSpec.describe "いいねを追加", type: :system do
  before do
    @post = FactoryBot.create(:post)
  end
  
  it 'ログインしたユーザーは投稿詳細ページでいいねを追加できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'email', with: @post.user.email
    fill_in 'password', with: @post.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 投稿詳細ページに遷移する
    visit post_path(@post)
    # いいねを送信できるリンクが存在することを確認する
    expect(page).to have_selector('#no_like_btn')
    # いいねを送信するとLikeモデルのカウントが1上がることを確認する
    expect{
      find('#no_like_btn').click
    }.to change { Like.count }.by(1)
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(post_path(@post))
    # 「いいねをしました」という文字が存在することを確認する
    expect(page).to have_content "いいねをしました"
    # 詳細ページに先程追加されたいいねが存在することを確認する
    expect(page).to have_selector('#has_like_btn')
  end
end

RSpec.describe "いいねを削除", type: :system do
  before do
    @like1 = FactoryBot.create(:like)
    @like2 = FactoryBot.create(:like)
  end
  context 'いいねを削除できる時' do
    it 'ログインしたユーザーは自らが追加したいいねの削除ができる' do
       # いいね1を追加したユーザーでログインする
       visit new_user_session_path
       fill_in 'email', with: @like1.user.email
       fill_in 'password', with: @like1.user.password
       find('input[name="commit"]').click
       expect(current_path).to eq(root_path)
       # いいね1が追加された投稿の詳細ページへ遷移する
       visit post_path(@like1.post)
       # 詳細ページにいいねの削除へのリンクがあることを確認する
       expect(page).to have_link href: post_like_path(@like1.post.id, @like1.id)
       # いいねを削除するとレコードの数が1減ることを確認する
       expect{
         find('#has_like_btn').click
         expect(page).to have_content "いいねを取り消しました"
       }. to change{ Like.count }.by(-1)
       # 詳細ページにリダイレクトしたことを確認する
       expect(current_path).to eq(post_path(@like1.post.id))
       # 詳細ページにはいいね１の内容が存在しないことを確認する
       expect(page).to have_no_selector('#has_like_btn')
    end
  end
  context 'いいねを削除できない時' do
    it 'ログインしたユーザーは自分以外が追加したいいねの削除ができない' do
       # いいね1を追加したユーザーでログインする
       visit new_user_session_path
       fill_in 'email', with: @like1.user.email
       fill_in 'password', with: @like1.user.password
       find('input[name="commit"]').click
       expect(current_path).to eq(root_path)
       # いいね2が追加された投稿の詳細ページへ遷移する
       visit post_path(@like2.post)
       # いいね2に「削除」へのリンクがないことを確認する
       expect(page).to have_no_link href: post_like_path(@like2.post.id, @like2.id)
    end
    it 'ログインしていないと投稿のいいねボタンがない' do
      # トップページに移動する
      visit root_path
      # いいね1が追加された投稿の詳細ページへ遷移する
      visit post_path(@like1.post)
      # いいねボタンがないことを確認する
      expect(page).to have_no_selector('#has_like_btn')
      # トップページに移動する
      visit root_path
      # いいね2が追加された投稿の詳細ページへ遷移する
      visit post_path(@like2.post)
      # いいねボタンがないことを確認する
      expect(page).to have_no_selector('#has_like_btn')
    end
  end
end