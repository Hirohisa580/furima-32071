require 'rails_helper'

  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe "ユーザー登録機能" do
    context "登録が上手く行くとき" do
      it "nickname, email, password, password_confirmation, first_name, first_name_ruby, last_name, last_name_ruby, birthdayが入力されていれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context "登録が上手くいかないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end



      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@が入っていないと登録できない" do
        @user.email = "aaagmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end



      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordとpassword_confirmationが一致しない場合は登録できない" do
        @user.password_confirmation = "b12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが半角数字のみの場合は登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが半角英字のみの場合は登録できない" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが全角の場合は登録できない" do
        @user.password = "Ａ１２３４"
        @user.password_confirmation = "Ａ１２３４"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが半角英数字混合だが、5文字以下だと登録できない" do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end



      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "first_nameが全角かな以外の入力だと登録できない" do
        @user.first_name = "hiroki"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_nameが全角かな以外の入力だと登録できない" do
        @user.last_name = "tanaka"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end



      it "first_name_rubyが空だと登録できない" do
        @user.first_name_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end

      it "first_name_rubyがカタカナ以外の入力だと登録できない" do
        @user.first_name_ruby = "ひろき"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end

      it "last_name_rubyが空だと登録できない" do
        @user.last_name_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
      end

      it "first_name_rubyがカタカナ以外の入力だと登録できない" do
        @user.first_name_ruby = "花子"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end



      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

