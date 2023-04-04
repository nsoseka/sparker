class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @q = User.ransack(params[:q])
    @skip = params[:skip].nil? ? 0 : params[:skip].to_i
    page = (@skip / 10) + 1
    loading = false

    begin
      @pagy, @users = pagy(@q.result, items: 10)

      if page > @pagy.pages
        @loading = true
        @pagy, @users = pagy(@q.result, items: 10, page: @pagy.pages)
      else
        @pagy, @users = pagy(@q.result, items: 10, page: page)
      end

      if @skip.nil?
        @skip = "0"
      else
        @skip = @skip.to_i + 10
      end
    rescue => exception
      @loading = true
      @users = []
    end

    if @skip > User.count
      @skip = User.count
    end

    FetchUsersJob.perform_later(@skip)
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
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
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def mass_delete
    ids = params[:ids].split(",")
    User.where(id: ids).destroy_all

    respond_to do |format|
      format.html { redirect_to users_url, notice: "Users were successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :maiden_name, :age, :gender, :email, :phone, :username, :password, :birth_date, :image, :blood_group, :height, :weight, :eye_color, :domain, :ip, :mac_address, :university, :ein, :ssn, :user_agent, address_attributes: [:id, :address, :state, :city, :postal_code, :user_id, :company_id, :_blank, coordinate_attributes: [:id, :lng, :lat, :_blank]],
      company_attributes: [:id, :department, :name, :title, :user_id, :_blank, address_attributes: [:id, :address, :state, :city, :postal_code, :user_id, :company_id, :_blank, coordinate_attributes: [:id, :lng, :lat, :_blank]]],
      hair_attributes: [:id, :color, :hair_type, :user_id, :_blank],
      bank_attributes: [:id, :card_expire, :card_number, :card_type, :currency, :iban, :user_id, :_blank])
    end
end
