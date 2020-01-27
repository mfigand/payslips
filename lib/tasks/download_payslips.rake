# frozen_string_literal: true

namespace :download do
  task :payslips, %i[host file_name] => :environment do |_t, args|
    config = config_params(args)

    url = url(config)

    file = download_file(url)

    if download_success(file)
      payslips = file.read.split
      import_payslips(payslips)
    else
      download_error(file)
    end
  end

  def config_params(args)
    default_host = 'https://gist.githubusercontent.com/rodrigm/bf42bf2aa0f1d17381b412a3ffec7fd9/raw/3997a797e334d19e8ef3fb853cf474b22237522d/'
    default_file_name = 'payslips.201812.txt'

    {}.tap do |config|
      config[:host] = args[:host] || default_host
      config[:file_name] = args[:file_name] || default_file_name
    end
  end

  def url(config)
    config[:host] + config[:file_name]
  end

  def download_file(url)
    URI.parse(url).open
  rescue OpenURI::HTTPError => e
    e
  end

  def download_success(file)
    file.instance_of?(StringIO)
  end

  def download_error(error)
    puts "Error: file can't be found - #{error.message}" unless Rails.env.test?
  end

  def import_payslips(payslips)
    payslips.each do |payslip|
      payslip_attr = parse_payslips(payslip)

      save_payslip(payslip_attr) unless already_imported(payslip_attr[:registry_id])
    end
  end

  def parse_payslips(payslip)
    Payslips::ParserService.parse(payslip)
  end

  def already_imported(registry_id)
    Payslip.find_by(registry_id: registry_id).present?
  end

  def save_payslip(payslip_attr)
    payslip_saved = Payslips::SaveRepository.resolve(payslip_attr)
    payslip_error(payslip_saved.errors) unless payslip_saved.valid?
  end

  def payslip_error(error)
    puts "Error: payslip can't be saved - #{error.messages}" unless Rails.env.test?
  end
end
