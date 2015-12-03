require 'support/media_controller_spec'

RSpec.describe MediaController, type: :controller do
  let(:model) { Medium.create(name: "something", rank: 10, type: "Album") }
  let(:good_params) { { album: { name: "name" } } }
  let(:bad_params) { { album: { name: nil } } }
  let(:create_params) { {medium: {name: "name", type: "Album"} } }

  it_behaves_like "media controller", Medium
end

RSpec.describe MediaController, type: :controller do
  let(:model) { Medium.create(name: "something", rank: 10, type: "Book") }
  let(:good_params) { { book: { name: "name" } } }
  let(:bad_params) { { book: { name: nil } } }
  let(:create_params) { {medium: {name: "name", type: "Book"} } }

  it_behaves_like "media controller", Medium
end

RSpec.describe MediaController, type: :controller do
  let(:model) { Medium.create(name: "something", rank: 10, type: "Movie") }
  let(:good_params) { { movie: { name: "name" } } }
  let(:bad_params) { { movie: { name: nil } } }
  let(:create_params) { {medium: {name: "name", type: "Movie"} } }

  it_behaves_like "media controller", Medium
end
