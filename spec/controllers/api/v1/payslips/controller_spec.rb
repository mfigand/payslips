# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::PayslipsController, type: :controller do
  let(:params) do
    { date: { month: '09', year: '2018' } }
  end 

  describe '#index' do
    it do
      get :index, params: params
      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    it do
      put :update, params: { id: 'id' }
      expect(response.status).to eq(404)
    end
  end
end
