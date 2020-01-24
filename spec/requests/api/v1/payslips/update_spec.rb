# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'paylips update requests' do
  describe 'PUT /payslips/:id' do
    subject(:endpoint_call) do
      put "/api/v1/payslips/#{id}", params: { tax_rate: tax_rate }
    end

    let(:number_of_payslips) { 10 }
    let(:payslips) do
      create_list(:payslip, number_of_payslips)
    end
    let(:id) { payslip.id }
    let(:payslip) { payslips.first }
    let(:tax_rate) { 12.45 }
    let(:data_response) { JSON.parse(response.body)['data'] }

    context 'valid id' do
      it do
        subject
        expect(data_response['registry_id']).to eq(payslip.registry_id)
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
