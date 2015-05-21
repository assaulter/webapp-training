ENV['RACK_ENV'] = 'test'

require './app/spec/spec_helper'
require './app/app'

describe 'MyApp' do
  include Rack::Test::Methods

  def app
    MyApp
  end

  describe 'todo' do
    context '正常な値の場合' do
      it 'validationに成功する' do
        actual = build(:todo).valid?
        expect(actual).to be_truthy
      end
    end

    context 'titleが空の場合' do
      it 'validationに失敗する' do
        actual = build(:todo, title: '').valid?
        expect(actual).to be_falsey
      end

      it 'エラーメッセージを取得できる' do
        obj = build(:todo, title: '')
        obj.valid?
        actual = obj.errors.messages[:title][0]

        pp obj.errors

        expected = "can't be blank"
        expect(actual).to eq(expected)
      end
    end
  end
end
