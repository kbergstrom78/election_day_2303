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
  
  describe "#candidates" do  
    it "lists all candidates from all races" do
      race1 = Race.new("Student Body President")
      race2 = Race.new("Student Body VP")
      race3 = Race.new("Student Body Treasurer")
      @election.add_race(race1)
      @election.add_race(race2)
      @election.add_race(race3)
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Mairen H", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Colin H", party: :republican})
      candidate5 = race2.register_candidate!({name: "Connor H", party: :independent})  
      expect(@election.candidates).to eq [candidate1, candidate2, candidate3, candidate4, candidate5]
    end
  end

  describe "#vote_counts" do
    it "tallies candidate votes" do
      race1 = Race.new("Student Body President")
      race2 = Race.new("Student Body VP")
      race3 = Race.new("Student Body Treasurer")
      @election.add_race(race1)
      @election.add_race(race2)
      @election.add_race(race3)
      candidate1 = race1.register_candidate!({name: "Diana D", party: :democrat})
      candidate2 = race1.register_candidate!({name: "Roberto R", party: :republican})
      candidate3 = race2.register_candidate!({name: "Mairen H", party: :democrat})
      candidate4 = race2.register_candidate!({name: "Colin H", party: :republican})
      candidate5 = race2.register_candidate!({name: "Connor H", party: :independent})  
      12.times {candidate1.vote_for!}
      7.times {candidate2.vote_for!}
      10.times {candidate3.vote_for!}
      5.times {candidate4.vote_for!}
      2.times {candidate5.vote_for!}
      expect(@election.vote_counts).to eq({
                          "Diana D" => 12, 
                          "Roberto R" => 7, 
                          "Mairen H" => 10,
                          "Colin H" => 5,
                          "Connor H" => 2})
    end
  end
end