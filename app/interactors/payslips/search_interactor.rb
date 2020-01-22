# frozen_string_literal: true

module Payslips
  class SearchInteractor
    attr_accessor :month, :year, :date

    def initialize(params)
      @month = params[:month]
      @year = params[:year]
      @date = @year + @month
    end

    def resolve
      Payslips::SearchRepository.resolve(self)
    end
  end
end
