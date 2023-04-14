require 'rspec'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")
    @candidate_1 = Candidate.new({name: "Diana D", party: :democrat})
    @candidate_2 = Candidate.new({name: "Roberto R", party: :republican}) 
  end
  
  describe "#initialize" do
    it "exists" do
      expect(@race).to be_a(Race)
    end
    
    it "has attributes" do
      expect(@race.office).to eq("Texas Governor")
      expect(@race.candidates).to eq([])
    end
  
  end
end
