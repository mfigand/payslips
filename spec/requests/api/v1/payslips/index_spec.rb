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
    let(:data_response) { JSON.parse(response.body)['data'] }
    let(:serialized_keys) do
      ['registry_id', 'vat_idNumber', 'date', 'gross', 'national_insurance_rate',
      'amount_national_insurance_deductions', 'tax_rate', 'amount_taxes', 'net', 'raw_data']
    end

    before { payslips }

    context '' do
      it do
        subject
        expect(data_response.count).to eq(number_of_payslips)
      end

      it do
        subject
        expect(data_response.first.keys).to eq(serialized_keys)
      end
    end
  end
end
