# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payslip, type: :model do
  let(:registry_id) { '000000000001' }
  let(:vat_idNumber) { '97084172E' }
  let(:date) { '20181231' }
  let(:gross) { '00248600' }
  let(:national_insurance_rate) { '0500' }
  let(:amount_national_insurance_deductions) { '00012430' }
  let(:tax_rate) { '1200' }
  let(:amount_taxes) { '00029832' }
  let(:net) { '00206337' }
  let(:payslip) do
    build(:payslip, registry_id: registry_id,
                    vat_idNumber: vat_idNumber,
                    date: date,
                    gross: gross,
                    national_insurance_rate: national_insurance_rate,
                    amount_national_insurance_deductions: amount_national_insurance_deductions,
                    tax_rate: tax_rate,
                    amount_taxes: amount_taxes,
                    net: net)
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
  end
end
