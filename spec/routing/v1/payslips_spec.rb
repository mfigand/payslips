# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'payslips routing' do
  subject { { get: 'api/v1/payslips' } }
  let(:controller) { 'api/v1/payslips' }

  it { expect(get: 'api/v1/payslips').to route_to('api/v1/payslips#index') }
  it do
    is_expected.to route_to(controller: controller,
                            action: 'index')
  end
end
