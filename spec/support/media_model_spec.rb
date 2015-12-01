require 'spec_helper'

RSpec.shared_examples "media model" do
	let(:media) { described_class }

	describe ".validates" do
	  it "must have a name" do
	    expect(media.new(name: nil)).to_not be_valid
	  end
	end
end
