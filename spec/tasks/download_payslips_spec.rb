# frozen_string_literal: true

require 'rails_helper'
require 'rake'

RSpec.describe 'download:payslips' do
  let(:host) do
    'https://gist.githubusercontent.com/rodrigm/bf42bf2aa0f1d17381b412a3ffec7fd9/raw/3997a797e334d19e8ef3fb853cf474b22237522d/'
  end
  let(:file_name) { 'payslips.201812.txt' }
  let(:task_name) { 'download:payslips' }
  let(:config_file) {}
  let(:download_payslips_task) { Rake::Task[task_name].invoke(host, file_name) }

  before do
    Rails.application.load_tasks
    Rake::Task[task_name].reenable
    Rake::Task.define_task(:environment)
  end

  describe 'import payslips records' do
    context 'assuming remote file has 10 records' do
      it do
        expect { download_payslips_task }.to change { Payslip.count }.by(10)
      end
    end

    context 'unable to download file' do
      let(:file_name) { 'nonexistent_file.txt' }

      it do
        expect { download_payslips_task }.to change { Payslip.count }.by(0)
      end
    end
  end
end
