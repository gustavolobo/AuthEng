require 'rails_helper'

module AuthEng
  RSpec.describe User, type: :model do
    describe 'validations' do
      it 'is valid with a valid email' do
        user = User.new(email: 'test@example.com')
        expect(user).to be_valid
      end

      it 'is invalid without an email' do
        user = User.new(email: nil)
        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid with a duplicate email' do
        User.create!(email: 'duplicate@example.com') # First record
        user = User.new(email: 'duplicate@example.com')

        expect(user).not_to be_valid
        expect(user.errors[:email]).to include("has already been taken")
      end
    end
  end
end
