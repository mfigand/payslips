# frozen_string_literal: true

namespace :download do
  task :payslips, %i[host file_name] => :environment do |_t, args|
    config = config_params(args)

    url = url(config)

    file = download_file(url)

    payslips = file.read.split

    import_payslips(payslips)
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
  end

  def import_payslips(payslips)
    payslips.each do |payslip|
      payslip_attr = parse_payslips(payslip)

      Payslip.create(payslip_attr) unless already_imported(payslip_attr[:registry_id])
      # PayslipsRepository.save(payslip) unless already_imported(payslip_attr[:registry_id])
    end
  end

  def parse_payslips(payslip)
    {}.tap do |p|
      p[:registry_id] = payslip[ranges[:registry_id]]
      p[:vat_idNumber] = payslip[ranges[:vat_idNumber]]
      p[:date] = payslip[ranges[:date]]
      p[:gross] = payslip[ranges[:gross]]
      p[:national_insurance_rate] = payslip[ranges[:national_insurance_rate]]
      p[:amount_national_insurance_deductions] = payslip[ranges[:amount_national_insurance_deductions]]
      p[:tax_rate] = payslip[ranges[:tax_rate]]
      p[:amount_taxes] = payslip[ranges[:amount_taxes]]
      p[:net] = payslip[ranges[:net]]
    end
  end

  def already_imported(registry_id)
    Payslip.find_by(registry_id: registry_id).present?
  end

  def ranges
    {}.tap do |ranges|
      ranges[:registry_id] = 0...12
      ranges[:vat_idNumber] = 12...21
      ranges[:date] = 21...29
      ranges[:gross] = 29...37
      ranges[:national_insurance_rate] = 37...41
      ranges[:amount_national_insurance_deductions] = 41...49
      ranges[:tax_rate] = 49...53
      ranges[:amount_taxes] = 53...61
      ranges[:net] = 61...69
    end
  end
end
