class UsersController < ApplicationController
  before_action :authorize_admin
  before_action :set_user, only: %i[ show edit update ]
  skip_before_action :user_is_admin

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create    
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def authorize_admin
      render "static_pages/error401", status: :unauthorized unless current_user && current_user.admin 
    end

    def set_user
      @user = User.find_by(id: params[:id])
      render "static_pages/error404", status: :not_found if @user.nil?
    end

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :phone,
        :rank,
        :jedi,
        :admin,
        :password,
        :password_confirmation
      )
    end
end
