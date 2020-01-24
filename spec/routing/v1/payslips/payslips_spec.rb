# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payslips routing' do
  subject { endpoint }
  let(:controller) { 'api/v1/payslips' }

  context '#index' do
    let(:path) { 'api/v1/payslips' }
    let(:endpoint) { { get: path } }

    it do
      is_expected.to route_to(controller: controller, action: 'index')
    end
  end

  context '#udpate' do
    let(:path) { 'api/v1/payslips/:id' }
    let(:endpoint) { { put: path } }

    it do
      is_expected.to route_to(controller: controller,
                              action: 'update',
                              id: ':id')
    end
  end
end
