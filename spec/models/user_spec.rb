require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create({
      first_name: 'First',
      last_name: 'Last',
      email: 'email@email.email',
      password: 'password',
      password_confirmation: 'password'
      })
  end

  describe 'Validations' do
    it 'creates successfully with all valid fields' do
      expect(@user).to be_valid
    end
    it 'is not valid if password and password_confirmation do not match' do
      @user.password_confirmation = 'psswd'
      expect(@user).not_to be_valid
    end
    it 'is not valid if the new user\'s email is already in use' do
      @user2 = User.create({
        email: 'EMAIL@email.email',
        password: 'word',
        password_confirmation: 'word'
        })
        expect(@user2).not_to be_valid
    end
    it 'is not valid if first_name is nil' do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end
    it 'is not valid if last_name is nil' do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end
    it 'is not valid if password length is less than 6 characters' do
      @user.password = 'pass'
      @user.password_confirmation = 'pass'
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    
  end
end
