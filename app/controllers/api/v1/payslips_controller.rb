# frozen_string_literal: true

module Api
  module V1
    class PayslipsController < ApplicationController
      def index
        search = Payslips::SearchInteractor.new(search_params).resolve
        render json: Payslips::IndexPresenter.new(search).resolve
      end

      def update
        payslip = Payslips::UpdateInteractor.new(params[:id], safe_params).resolve
        presenter = Payslips::UpdatePresenter.new(payslip).resolve
        render json: presenter, status: presenter[:status]
      end

      private

      def safe_params
        params.permit(:date, :tax_rate)
      end

      def search_params
        params.require(:date).permit(:month, :year).tap do |search_params|
          search_params.require(:month)
          search_params.require(:year)
        end
      end
    end
  end
end
