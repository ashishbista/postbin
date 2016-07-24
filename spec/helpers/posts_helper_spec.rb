require 'rails_helper'

RSpec.describe PostsHelper, type: :helper do
  describe '#url' do
    it 'returns complete url' do
      expect(helper.url).to eq "http://test.host"
    end
  end
end
