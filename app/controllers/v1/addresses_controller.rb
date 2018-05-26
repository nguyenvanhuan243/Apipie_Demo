module V1
  class AddressesController < ApplicationController
    before_action :find_user

    api!
    def index
      @address = @user.addresses.all.limit(5)
      render json: @address
    end

    api!
    param :address, Hash do
      param :phone, :undef
      param :country, :undef
    end

    api!
    def create
      @address = @user.addresses.new(address_params)
      if @address.save
        render json: @address, status: :created, location: [@user, @address]
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end

    private

    def find_user
      @user = User.find_by_id(params[:user_id])
    end

    def address_params
      params.require(:address).permit(:phone, :country)
    end
  end
end
