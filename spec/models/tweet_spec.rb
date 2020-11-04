require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '投稿機能' do
    context '投稿情報を保存できる場合' do
      it '必須項目が存在していれば保存できる' do
        expect(@tweet).to be_valid
      end
    end

    context '投稿情報を保存できない場合' do
      it '画像が空では保存できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include
      end
      it '渓谷名が空では保存できない' do
        @tweet.title = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('渓谷名を入力してください')
      end
      it '渓谷の説明が空では保存できない' do
        @tweet.concept = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('「渓谷について」を入力してください')
      end
      it '都道府県についての情報が「---」のときは保存できない' do
        @tweet.prefecture_id = 1
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it '費用についての情報が空では保存できない' do
        @tweet.price = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('費用を入力してください')
      end
      it '費用は全角数字だと場合は保存できない' do
        @tweet.price = '３４５'
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include
      end
      it '訪問日が空では登録できない' do
        @tweet.visit_day = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('訪問日を入力してください')
      end
      it 'userが紐づいていないと出品情報は保存されない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
