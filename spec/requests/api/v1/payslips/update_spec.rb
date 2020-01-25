# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'paylips update requests' do
  describe 'PUT /payslips/:id' do
    subject(:endpoint_call) do
      put "/api/v1/payslips/#{id}", params: { tax_rate: new_tax_rate }
    end

    let(:number_of_payslips) { 10 }
    let(:payslips) do
      create_list(:payslip, number_of_payslips)
    end
    let(:id) { payslip.id }
    let(:payslip) { payslips.first }
    let(:new_tax_rate) { 12.45 }
    let(:data_response) { JSON.parse(response.body)['data'] }
    let(:new_amount_taxes) { payslip.gross * (new_tax_rate / 100) }
    let(:new_net) do
      payslip.gross - (payslip.amount_national_insurance_deductions + new_amount_taxes)
    end
    let(:updated_attributes) do
      { 'registry_id' => payslip.registry_id,
        'vat_idNumber' => payslip.vat_idNumber,
        'date' => payslip.date.to_s,
        'gross' => payslip.gross,
        'national_insurance_rate' => payslip.national_insurance_rate,
        'amount_national_insurance_deductions' => payslip.amount_national_insurance_deductions,
        'tax_rate' => new_tax_rate,
        'amount_taxes' => new_amount_taxes,
        'net' => new_net,
        'raw_data' => payslip.raw_data }
    end

    context 'valid id' do
      it do
        subject
        expect(data_response['registry_id']).to eq(payslip.registry_id)
      end

      it do
        subject
        expect(data_response).to include(updated_attributes)
      end
    end

    context 'invalid id' do
      let(:id) { 'id' }

      it do
        subject
        expect(response.status).to eq(404)
      end
    end
  end
end
