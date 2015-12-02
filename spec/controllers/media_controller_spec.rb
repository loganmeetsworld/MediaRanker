require 'rails_helper'

RSpec.describe MediaController, type: :controller do
	let(:model) { Medium }
	it_behaves_like "media controller"
end
