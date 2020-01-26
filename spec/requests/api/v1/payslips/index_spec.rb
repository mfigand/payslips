# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'paylips index requests' do
  describe 'GET /payslips' do
    subject(:endpoint_call) do
      get '/api/v1/payslips', params: date
    end

    let(:date) do
      { date: { month: month, year: year } }
    end
    let(:month) { '12' }
    let(:year) { '2018' }
    let(:number_of_payslips) { 10 }
    let(:payslips) do
      create_list(:payslip, number_of_payslips)
    end
    let(:data_response) { JSON.parse(response.body)['data'] }
    let(:serialized_keys) do
      %w[registry_id vat_idNumber date gross national_insurance_rate
         amount_national_insurance_deductions tax_rate amount_taxes net raw_data]
    end

    before { payslips }

    context 'valid params' do
      it do
        subject
        expect(data_response.count).to eq(number_of_payslips)
      end

      it do
        subject
        expect(data_response.first.keys).to eq(serialized_keys)
      end
    end

    context 'empty params' do
      let(:month) { '' }

      it do
        expect { subject }.to raise_error ActionController::ParameterMissing
      end
    end
  end
end
