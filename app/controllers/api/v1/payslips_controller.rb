# frozen_string_literal: true

module Api
  module V1
    class PayslipsController < ApplicationController
      def index
        render json: { data: 'ok' }
      end
    end
  end
end
