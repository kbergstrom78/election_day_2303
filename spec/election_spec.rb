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

  describe "#add_race" do
    it "adds races to an election" do
      race1 = Race.new("Student Body President")
      race2 = Race.new("Student Body VP")
      race3 = Race.new("Student Body Treasurer")
      @election.add_race(race1)
      @election.add_race(race2)
      @election.add_race(race3)
      expect(@election.races).to eq([race1, race2, race3])
    end
  end

end