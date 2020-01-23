# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payslip, type: :model do
  let(:registry_id) { '000000000001' }
  let(:vat_idNumber) { '97084172E' }
  let(:date) { Date.parse('20181231') }
  let(:gross) { 2486.25  }
  let(:national_insurance_rate) { 5.33 }
  let(:amount_national_insurance_deductions) { 124.35 }
  let(:tax_rate) { 12.12  }
  let(:amount_taxes) { 298.32 }
  let(:net) { 2063.37 }
  let(:raw_data) { '00000000000197084172E201812310024860005000001243012000002983200206337' } 
  let(:payslip) do
    build(:payslip, registry_id: registry_id,
                    vat_idNumber: vat_idNumber,
                    date: date,
                    gross: gross,
                    national_insurance_rate: national_insurance_rate,
                    amount_national_insurance_deductions: amount_national_insurance_deductions,
                    tax_rate: tax_rate,
                    amount_taxes: amount_taxes,
                    net: net,
                    raw_data: raw_data)
  end

  it 'With valid attributes' do
    expect(payslip).to be_valid
  end

  describe 'Invalid' do
    context 'without registry_id' do
      let(:registry_id) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without vat_idNumber' do
      let(:vat_idNumber) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without date' do
      let(:date) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without gross' do
      let(:gross) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without national insurance rate' do
      let(:national_insurance_rate) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without amount national insurance deductions' do
      let(:amount_national_insurance_deductions) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without tax rate' do
      let(:tax_rate) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without amount taxes' do
      let(:amount_taxes) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without net' do
      let(:net) { nil }

      it { expect(payslip).to_not be_valid }
    end

    context 'without raw data' do
      let(:raw_data) { nil }

      it { expect(payslip).to_not be_valid }
    end
  end
end
