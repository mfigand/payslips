# frozen_string_literal: true

module Api
  module V1
    class PayslipsController < ApplicationController
      def index
        search = Payslips::SearchInteractor.new(safe_params).resolve
        # render json: PayslipPresenter.new(search).show
        render json: { data: 'ok' }
      end

      private

      def safe_params
        params.permit(:month, :year)
      end
    end
  end
end
