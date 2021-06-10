require 'rails_helper'

RSpec.describe "新規投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post_title = Faker::Name.initials(number: 40)
    @post_text = Faker::Name.initials
  end

  context '新規投稿できる時' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('とうこう')
      # 投稿ページに移動する
      visit new_post_path
      # フォームに情報を入力する
      select 'ニキビで悩んだ体験談', from: 'post[category_id]'
      fill_in 'post[title]', with: @post_title
      fill_in 'post[text]', with: @post_text
      # 送信するとPostモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(1)
      # 投稿詳細ページに遷移することを確認する
      expect(current_path).to eq(post_path(@user.posts.ids))
      # 「投稿が完了しました」の文字があることを確認する
      expect(page).to have_content('投稿が完了しました')
      # トップページには先ほど投稿した投稿が存在することを確認する（ユーザーネーム）
      expect(page).to have_content(@user.nickname)
      end
  end
  context '新規投稿できない時' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('とうこう')
    end
  end
end

RSpec.describe '投稿編集', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end
  context 'ツイート編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿した投稿の編集ができる' do
       # post1を投稿したユーザーでログインする
       visit new_user_session_path
       fill_in 'メールアドレス', with: @post1.user.email
       fill_in 'パスワード', with: @post1.user.password
       find('input[name="commit"]').click
       expect(current_path).to eq(root_path)
      # 投稿詳細ページへ遷移する
      visit post_path(@post1)
      # post1に「編集」へのリンクがあることを確認する
      expect(page).to have_link 'Edit', href: edit_post_path(@post1)
      # 編集ページへ遷移する
      visit edit_post_path(@post1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#post_category_id').value
      ).to eq "#{@post1.category_id}"
      expect(
        find('#post_title').value
      ).to eq(@post1.title)
      expect(
        find('#post_text').value
      ).to eq(@post1.text)
      # 投稿内容を編集する
      select '自分なりのニキビ治療法', from: 'post[category_id]'
      fill_in 'post[title]', with: "#{@post1.title}+編集したタイトル"
      fill_in 'post[text]', with: "#{@post1.text}+編集したテキスト"
      # 編集してもTweetモデルのカウントは変わらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(0)
      # 投稿詳細ページに遷移したことを確認する
      expect(current_path).to eq(post_path(@post1))
      # 「編集が完了しました」の文字があることを確認する
      expect(page).to have_content('編集が完了しました')
      # トップページに遷移する
      visit root_path
      # トップページには先ほど変更した内容のツイートが存在することを確認する（ユーザーネーム）
      expect(page).to have_content(@post1.user.nickname)
    end
  end
  context '投稿編集ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した投稿の編集画面には遷移できない' do
      # 投稿1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @post1.user.email
      fill_in 'パスワード', with: @post1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 投稿2の投稿詳細ページへ遷移する
      visit post_path(@post2)
      # 投稿2に「編集」へのリンクがないことを確認する
      expect(page).to have_no_link 'Edit', href: edit_post_path(@post2)
    end
    it 'ログインしていないと投稿の編集画面には遷移できない' do
      # トップページにいる
      visit root_path
      # 投稿1の詳細ページへ遷移する
      visit post_path(@post1)
      # 投稿1に「編集」へのリンクがないことを確認する
      expect(page).to have_no_link 'Edit', href: edit_post_path(@post1)
      # 投稿2の詳細ページへ遷移する
      visit post_path(@post2)
      # 投稿2に「編集」へのリンクがないことを確認する
      expect(page).to have_no_link 'Edit', href: edit_post_path(@post2)
    end
  end
end

RSpec.describe '投稿削除', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end
  context '投稿削除ができるとき' do
    it 'ログインしたユーザーは自らが投稿した投稿の削除ができる' do
      # 投稿1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @post1.user.email
      fill_in 'パスワード', with: @post1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 投稿1の詳細ページへ遷移する
      visit post_path(@post1)
      # post1に「編集」へのリンクがあることを確認する
      expect(page).to have_link 'Edit', href: edit_post_path(@post1)
      # 投稿編集ページへ遷移する
      visit edit_post_path(@post1)
      # 投稿1の編集ページに「削除」へのリンクがあることを確認する
      expect(page).to have_link '投稿を削除する', href: post_path(@post1)
      # 投稿を削除するとレコードの数が1減ることを確認する
      find('#destroy_post_btn').click
      expect{
        expect(page.accept_confirm).to eq "本当に削除しますか？"
        expect(page).to have_content "投稿を削除しました"
      }. to change{ Post.count }.by(-1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # 「投稿を削除しました」の文字があることを確認する
      expect(page).to have_content("投稿を削除しました")
      # トップページには投稿1の内容が存在しないことを確認する（ユーザーネーム）
      expect(page).to have_no_content(@post1.user.nickname)
    end
  end
  context '投稿削除ができないとき' do
    it 'ログインしたユーザーは自分以外が投稿した投稿の削除ができない' do
      # 投稿1を投稿したユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @post1.user.email
      fill_in 'パスワード', with: @post1.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 投稿2の詳細ページへ遷移する
      visit post_path(@post2)
      # 投稿2に「編集」へのリンクがないことを確認する
      expect(page).to have_no_link 'Edit', href: edit_post_path(@post2)
    end
    it 'ログインしていないと投稿の削除ボタンがない' do
      # トップページに移動する
      visit root_path
      # 投稿1の詳細ページへ遷移する
      visit post_path(@post1)
      # 投稿1に「編集」へのリンクがないことを確認する
      expect(page).to have_no_link 'Edit', href: edit_post_path(@post1)
      # トップページに移動する
      visit root_path
      # 投稿2の詳細ページへ遷移する
      visit post_path(@post2)
      # 投稿2に「編集」へのリンクがないことを確認する
      expect(page).to have_no_link 'Edit', href: edit_post_path(@post2)
    end
  end
end

RSpec.describe '投稿詳細', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end
  it 'ログインしたユーザーは投稿詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    visit new_user_session_path
    fill_in 'メールアドレス', with: @post.user.email
    fill_in 'パスワード', with: @post.user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
    # 投稿に「詳細」へのリンクがあることを確認する
    expect(page).to have_link href: post_path(@post)
    # 詳細ページに遷移する
    visit post_path(@post)
    # 詳細ページに投稿の内容が含まれている
    expect(page).to have_content("ニキビで悩んだ体験談")
    expect(page).to have_content("#{@post.title}")
    expect(page).to have_content("#{@post.text}")
    # コメント用のフォームが存在する
    expect(page).to have_selector 'form'
  end
  it 'ログインしていない状態で投稿詳細ページに遷移できるもののコメント投稿欄が表示されない' do
    # トップページに移動する
    visit root_path
    # 投稿に「詳細」へのリンクがあることを確認する
    expect(page).to have_link href: post_path(@post)
    # 詳細ページに遷移する
    visit post_path(@post)
    # 詳細ページに投稿の内容が含まれている
    expect(page).to have_content("ニキビで悩んだ体験談")
    expect(page).to have_content("#{@post.title}")
    expect(page).to have_content("#{@post.text}")
    # フォームが存在しないことを確認する
    expect(page).to have_no_selector 'form'
    # 「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する
    expect(page).to have_content 'コメントの投稿には新規登録/ログインが必要です'
  end
end

RSpec.describe '投稿検索', type: :system do
  it ''
end
