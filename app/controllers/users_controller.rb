class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all.includes(:address, {company: :address})
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.build_address
    @user.build_company.build_address
  end

  # GET /users/1/edit
  def edit
    @user.build_address if @user.address.nil?
    @user.company.build_address if @user.company.address.nil?
  end

  # POST /users
  # POST /users.json
  def create
    # @user = User.create(user_params)
    # @user.build_address if @user.address.nil?
    # @user.company.build_address if @user.company.address.nil?
    # if not @user.id.nil?
    #   redirect_to users_path
    # else
    #   render :new
    # end

    @user = User.create(user_params)
    @user.build_address if @user.address.nil?
    @user.company.build_address if @user.company.address.nil?

    respond_to do |format|
      if !@user.id.nil?#@user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address,
                                 :date_of_birth, :phone_number,
                                 address_attributes: [ :street, :city, :zip_code, :country],
                                 company_attributes: [:name,
                                                      address_attributes: [:street, :city, :zip_code, :country]])
  end
end
