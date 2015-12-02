require 'spec_helper'

RSpec.shared_examples "media" do
	describe ".validates" do
	  it "must have a name" do
	  	medium = described_class.new 

	    expect(medium).to_not be_valid
	    expect(medium.errors.keys).to include(:name)
	  end

	  it "sets default rank to 0" do
      medium = described_class.create(name: "name")

      expect(medium.rank).to eq 0
    end
	end
end
