require 'rails_helper'

RSpec.describe Album, type: :model do
	describe Album do
    it_behaves_like "media model"
  end
end
