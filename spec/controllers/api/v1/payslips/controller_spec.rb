# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PayslipsController, type: :controller do
  describe '#index' do
    it do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    it do
      put :update
      expect(response.status).to eq(200)
    end
  end
end
