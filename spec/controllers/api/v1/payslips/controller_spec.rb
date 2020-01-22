# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PayslipsController, type: :controller do
  describe '#index' do
    it do
      get :index
      expect(response.body).to eq({ data: 'ok' }.to_json)
    end
  end
end
