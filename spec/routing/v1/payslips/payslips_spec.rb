# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payslips routing' do
  subject { endpoint }
  let(:controller) { 'api/v1/payslips' }

  context '#index' do
    let(:endpoint) { { get: controller } }

    it { expect(get: controller).to route_to('api/v1/payslips#index') }
    it do
      is_expected.to route_to(controller: controller, action: 'index')
    end
  end

  context '#udpate' do
    let(:endpoint) { { put: controller } }

    it { expect(put: controller).to route_to('api/v1/payslips#update') }
    it do
      is_expected.to route_to(controller: controller, action: 'update')
    end
  end
end
