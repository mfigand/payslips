# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'paylips index requests' do
  describe 'GET /payslips' do
    let(:month) { '12' }
    let(:year) { '2018' }
    subject(:endpoint_call) do
      get '/api/v1/payslips', params: { month: month,
                                        year: year }
    end
    let(:number_of_payslips) { 10 }
    let(:payslips) do
      create_list(:payslip, number_of_payslips)
    end

    before { payslips }

    it do
      subject
      expect(response.body).to eq({ data: 'ok' }.to_json)
    end
  end
end
