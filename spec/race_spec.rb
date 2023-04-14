require 'rspec'
require './lib/candidate'
require './lib/race'

RSpec.describe Race do
  before(:each) do
    @race = Race.new("Texas Governor")
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
  
  describe "#register_candidates" do
    it "registers 2 candidates and returns their info" do
    candidate1 = @race.register_candidate!({name: "Diana D", party: :democrat})
    expect(candidate1).to be_a(Candidate)
    expect(candidate1.name).to eq("Diana D")
    expect(candidate1.party).to eq(:democrat)
    candidate2 = @race.register_candidate!({name: "Roberto R", party: :republican})
    expect(@race.candidates).to eq([candidate1, candidate2])
    end
  end
end
