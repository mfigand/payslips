# frozen_string_literal: true

class RegistryIdService
  def self.generate
    loop do
      reg_id = rand.to_s[2..11]
      return reg_id unless Payslip.where(registry_id: reg_id).exists?
    end
  end
end
