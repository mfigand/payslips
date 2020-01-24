# frozen_string_literal: true

module Api
  module V1
    class PayslipsController < ApplicationController
      def index
        search = Payslips::SearchInteractor.new(safe_params).resolve
        render json: Payslips::IndexPresenter.new(search).resolve
      end

      def update
        payslip = Payslips::UpdateInteractor.new(params[:id], safe_params).resolve
        presenter = Payslips::UpdatePresenter.new(payslip).resolve
        render json: presenter, status: presenter[:status]
      end

      private

      def safe_params
        params.permit(:month, :year, :tax_rate)
      end
    end
  end
end
