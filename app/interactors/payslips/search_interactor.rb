# frozen_string_literal: true

module Payslips
  class SearchInteractor
    attr_accessor :month, :year

    def initialize(params)
      @month = params[:month]
      @year = params[:year]
    end

    def resolve
      Payslips::SearchRepository.resolve(self)
    end

    def date
      Date.strptime("#{@year}-#{@month}", '%Y-%m') if month && year
    end
  end
end
