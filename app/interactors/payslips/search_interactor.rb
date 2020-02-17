# frozen_string_literal: true

module Payslips
  class SearchInteractor
    attr_reader :month, :year

    def initialize(params)
      @month = params[:month]
      @year = params[:year]
    end

    def resolve
      Payslips::SearchRepository.new(date_query).by_date
    end

    private

    def date_query
      { date: date }
    end

    def date
      Date.strptime("#{@year}-#{@month}", '%Y-%m') if month && year
    end
  end
end
