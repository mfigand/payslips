# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ping requests' do
  describe 'GET /ping' do
    subject(:endpoint_call) { get '/ping' }

    it do
      subject
      expect(response.body).to eq({ data: 'pong' }.to_json)
    end
  end
end
