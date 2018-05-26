module V1
  class UsersController < BaseController
    def_param_group :tweet_group do
      param :street, String, "Street name"
      param :number, Integer
      param :zip, String
    end

    def_param_group :address_group do
      param :street, String, "Street name"
      param :number, Integer
      param :zip, String
    end

    def_param_group :comment_group do
      param :street, String, "Street name"
      param :number, Integer
      param :zip, String
    end

    def_param_group :user do
      param :user, Hash, :required => true, :action_aware => true do
        param :name, String, "Name of the user", :required => true
        param_group :tweet_group
        param_group :address_group
        param_group :comment_group
      end
    end

    api :GET, '/v1/users', 'Show all users: http://localhost:3000/api/v1/users' 
    def index
      @users = User.all
      render json: @users
    end

    api :GET, '/v1/users/:id', 'Show a user with id: http://localhost:3000/api/v1/users/1'
    def show
      # Should use find_by_id(:id), instead of find(:id)
      @user = User.find_by_id(params[:id])
      render json: @user
    end

    api :POST, '/v1/users/:id', 'Create a new user: http://localhost:3000/api/v1/users'
    param_group :user
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    api!
    param_group :user
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        head :no_content
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    api!
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      head :no_content
    end

    private

    def user_params
      params.require(:user).permit(:name)
    end

  end
end
