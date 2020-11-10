require 'rails_helper'

RSpec.describe Access, type: :model do
  before do
    @acccess = FactoryBot.build(:access)
  end

  describe '投稿機能' do
    context '投稿情報を保存できる場合' do
      it '必須項目が存在していれば保存できる' do
        expect(@tweet_acccess).to be_valid
      end
    end

    context '投稿情報を保存できない場合' do
      it '画像が空では保存できない' do
        @tweet_acccess.image = nil
        @tweet_acccess.valid?
        expect(@tweet_acccess.errors.full_messages).to include
      end
      it '渓谷名が空では保存できない' do
        @tweet_acccess.title = nil
        @tweet_acccess.valid?
        expect(@tweet_acccess.errors.full_messages).to include('渓谷名を入力してください')
      end
      it '渓谷の説明が空では保存できない' do
        @tweet_acccess.concept = nil
        @tweet_acccess.valid?
        expect(@tweet_acccess.errors.full_messages).to include('「渓谷について」を入力してください')
      end
      it '費用についての情報が空では保存できない' do
        @tweet_acccess.price = nil
        @tweet_acccess.valid?
        expect(@tweet_acccess.errors.full_messages).to include('費用を入力してください')
      end
      it '費用は全角数字だと場合は保存できない' do
        @tweet_acccess.price = '３４５'
        @tweet_acccess.valid?
        expect(@tweet_acccess.errors.full_messages).to include
      end
      
      it '都道府県についての情報が「---」のときは保存できない' do
        @tweet_acccess.prefecture_id = 1
        @tweet_acccess.valid?
        expect(@tweet_acccess.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it '市区町村が空では登録できない' do
        @tweet_acccess.city = ''
        @tweet_acccess.valid?
        expect(@tweet_acccess.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'アクセス方法が空では登録できない' do
        @tweet_acccess.access_plan = ''
        @tweet_acccess.valid?
        expect(@tweet_acccess.errors.full_messages).to include('アクセス方法を入力してください')
      end
    end
  end
end
