require 'support/media_controller_spec'

RSpec.describe MediaController, type: :controller do
  let(:model) { Medium.create(name: "something", rank: 10, type: "Album") }
  let(:good_params) { { album: { name: "name" } } }
  let(:bad_params) { { album: { name: nil } } }

  it_behaves_like "media controller", Medium
end

RSpec.describe MediaController, type: :controller do
  let(:model) { Medium.create(name: "something", rank: 10, type: "Book") }
  let(:good_params) { { book: { name: "name" } } }
  let(:bad_params) { { book: { name: nil } } }

  it_behaves_like "media controller", Medium
end

RSpec.describe MediaController, type: :controller do
  let(:model) { Medium.create(name: "something", rank: 10, type: "Movie") }
  let(:good_params) { { movie: { name: "name" } } }
  let(:bad_params) { { movie: { name: nil } } }

  it_behaves_like "media controller", Medium
end
