# frozen_string_literal: true

module Payslips
  class SearchInteractor
    attr_accessor :month, :year, :date

    def initialize(params)
      @month = params[:month]
      @year = params[:year]
    end

    def resolve
      Payslips::SearchRepository.resolve(self)
    end

    def date
      if month && year
        Date.strptime("#{@year}-#{@month}", '%Y-%m')
      end
    end
  end
end
