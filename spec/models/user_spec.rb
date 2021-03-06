require 'spec_helper'

describe User do
  before { @user = User.new(name: 'Mario Rossi', email: 'mario.rossi@domain.com', password: 'foobar', password_confirmation: 'foobar') }
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  
  describe 'when name is not present' do
    before { @user.name = '' }
    it { should_not be_valid }
  end
  
  describe 'when email is not present' do
    before { @user.email = '' }
    it { should_not be_valid }
  end
  
  describe 'when password is not present' do
    before { @user.password = @user.password_confirmation = "" }
    it { should_not be_valid }
  end
  
  describe "when password doesn't match its confirmation" do
    before { @user.password_confirmation = 'mismatch' }
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 4 }
    it { should_not be_valid }
  end
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }
    
    context "when password is valid" do
      it { should == found_user.authenticate(@user.password) }
    end
    
    context "when password is not valid" do
      let(:user_for_invalid_psw) { found_user.authenticate("invalid_password") }
      it { should_not == user_for_invalid_psw }
      specify { user_for_invalid_psw.should be_false }
    end
  end
  
  describe 'when name is too long' do
    before { @user.name = 'a' * 51 }
    it { should_not be_valid }
  end
  
  describe 'when email format is not valid' do
    it "don't pass the validation" do
      addresses = %w(invalid_domain.com invalid@domain,com withoutdomain.com nodot@domain)
      addresses.each do |address|
        @user.email = address
        should_not be_valid
      end
    end
  end
  
  describe 'when email is already taken' do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
end