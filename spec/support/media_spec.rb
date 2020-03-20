require 'spec_helper'

RSpec.shared_examples "media" do
 let(:media_type) { Medium.types[rand(0..2)].constantize }

	describe ".validates" do
		let(:no_name) { media_type.new(name: nil) }
    let(:no_type) { media_type.new(name: "Generic Test", type: nil) }

	  it "must have a name" do
	  	medium = described_class.new 

	  	expect(no_name).to_not be_valid
	    expect(medium).to_not be_valid
	    expect(medium.errors.keys).to include(:name)
	  end

	  it "must have a type" do 
	  	expect(no_type).to_not be_valid
	  end

	  it "sets default rank to 0" do
      medium = described_class.create(name: "name")

      expect(medium.rank).to eq 0
    end
	end
end
