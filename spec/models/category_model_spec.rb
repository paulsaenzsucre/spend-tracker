require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'shahadat@example.com', password: '12345678') }

  describe 'validations' do
    it 'requires a category name' do
      category = Category.create(name: '', icon: 'home.svg')

      expect(category).to_not be_valid
    end

    it 'requires a user' do
      category = Category.create(name: 'Tomato Soup', icon: 'home.svg')

      expect(category).to_not be_valid
    end

    it 'requires a icon' do
      category = Category.create(name: 'Tomato Soup', user:, icon: nil)

      expect(category).to_not be_valid
    end

    it 'is valid with all required attributes' do
      category = Category.create(name: 'Tomato Soup', user:, icon: 'home.svg')

      expect(category).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an user' do
      category = Category.create(name: 'Tomato Soup', user:, icon: 'home.svg')

      expect(category.user).to eql(user)
    end
  end
end
