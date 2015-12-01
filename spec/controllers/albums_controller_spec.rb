require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  it_behaves_like "medium controller"
  let(:model) { Album }
end