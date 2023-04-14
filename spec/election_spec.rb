require 'rspec'
require './lib/candidate'
require './lib/race'
require './lib/election'

RSpec.describe Election do
  before(:each) do
    @election = Election.new("2023")
  end

  describe "#initialize" do
    it "exists" do
      expect(@election).to be_an(Election)
    end
    
    it "has attributes" do
      expect(@election.year).to eq("2023")
    end
  
  end
end