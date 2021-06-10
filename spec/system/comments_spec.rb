require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @post = FactoryBot.create(:post)
    @comment = Faker::Lorem.sentence
  end

  it 'ログインしたユーザーは投稿詳細ページでコメント投稿できる' do
    # ログインする
    visit new_user_session_path
    fill_in 'メールアドレス', with: @post.user.email
    fill_in 'パスワード', with: @post.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 投稿詳細ページに遷移する
    visit post_path(@post)
    # フォームに情報を入力する
    fill_in 'comment[text]', with: @comment.to_s
    # コメントを送信すると、Commentモデルのカウントが1上がることを確認する
    find('button[name="button"]').click
    wait_for_ajax do
      change { Comment.count }.by(1)
    end
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(post_path(@post))
    # 詳細ページ上に先ほどのコメント内容が含まれていることを確認する
    expect(page).to have_content(@comment)
  end
end

RSpec.describe 'コメント削除', type: :system do
  before do
    @comment1 = FactoryBot.create(:comment)
    @comment2 = FactoryBot.create(:comment)
  end
  context 'コメント削除ができる時' do
    it 'ログインしたユーザーは自らが投稿したコメントの削除ができる' do
      # コメント1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @comment1.user.email
      fill_in 'パスワード', with: @comment1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # コメント1を投稿した投稿の詳細ページへ遷移する
      visit post_path(@comment1.post)
      # 詳細ページにコメント削除のリンクがあることを確認する
      expect(page).to have_link href: post_comment_path(@comment1.post.id, @comment1.id)
      # コメントを削除するとレコードの数が1減ることを確認する
      find('#comment_delete_btn').click
      expect do
        expect(page.accept_confirm).to eq '本当に削除しますか？'
        sleep 0.5
      end.to change { Comment.count }.by(-1)
      # 詳細ページにリダイレクトされることを確認する
      expect(current_path).to eq(post_path(@comment1.post))
      # 詳細ページにはコメント1の内容が存在しないことを確認する（テキスト）
      expect(page).to have_no_content(@comment1.text)
    end
  end
  context 'コメント削除ができない時' do
    it 'ログインしたユーザーは自分以外が投稿したコメントの削除ができない' do
      # コメント1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @comment1.user.email
      fill_in 'パスワード', with: @comment1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # コメント2が投稿された投稿の詳細ページへ遷移する
      visit post_path(@comment2.post)
      # コメント2に「削除」へのリンクがないことを確認する
      expect(page).to have_no_link href: post_comment_path(@comment2.post.id, @comment2.id)
    end
    it 'ログインしていないとコメント削除のボタンがない' do
      # トップページに移動する
      visit root_path
      # コメント1が投稿された投稿の詳細ページへ遷移する
      visit post_path(@comment1.post)
      # コメント１の「削除」へのリンクがないことを確認する
      expect(page).to have_no_link href: post_comment_path(@comment1.post.id, @comment1.id)
      # トップページに移動する
      visit root_path
      # コメント2が投稿された投稿の詳細ページへ遷移する
      visit post_path(@comment2.post)
      # コメント2の「削除」へのリンクがないことを確認する
      expect(page).to have_no_link href: post_comment_path(@comment2.post.id, @comment2.id)
    end
  end
end
