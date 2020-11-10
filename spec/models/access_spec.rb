require 'rails_helper'

RSpec.describe Access, type: :model do
  before do
    @access = FactoryBot.build(:access)
  end

  describe '投稿機能' do
    context '投稿情報を保存できる場合' do
      it '必須項目が存在していれば保存できる' do
        expect(@access).to be_valid
      end
    end

    context '投稿情報を保存できない場合' do
      it '都道府県についての情報が「---」のときは保存できない' do
        @access.prefecture_id = 1
        @access.valid?
        expect(@access.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it '市区町村が空では登録できない' do
        @access.city = ''
        @access.valid?
        expect(@access.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'アクセス方法が空では登録できない' do
        @access.access_plan = ''
        @access.valid?
        expect(@access.errors.full_messages).to include('アクセス方法を入力してください')
      end
      it 'tweetが紐づいていないと出品情報は保存されない' do
        @access.id = nil
        @access.valid?
        expect(@access.errors.full_messages).to include()
      end
    end
  end
end
