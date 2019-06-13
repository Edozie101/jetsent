require "rails_helper"


RSpec.describe User, :type => :model do

	before(:all) do
		@user1 = create(:user)
		@guest = create(:guest_user)
	end

	it "is valid with valid attributes" do 
		expect(@user1).to be_valid
		puts "it is valid"
	
	end

	it "should have false for guest when signing up a new user" do 
		expect(@user1.guest).to be_falseq 

	end

	it 'should raise an error when an email exists within the database' do
		expect{ create(:user)}.to raise_error
		
	end
	
end