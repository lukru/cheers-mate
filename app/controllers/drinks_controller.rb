class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]

  # GET /drinks
  # GET /drinks.json
  def index
    if params[:user_id]
      @drinks = current_user.drinks
    elsif params[:friends]
      @drinks = current_user.friends_drinks
    else
      @drinks = Drink.all
    end

    


    if @user.present? && params[:all].blank?
      @drinks = @drinks.where(:user_id => @user.id)
    end

    if params[:search]
      @drinks = @drinks.search(params[:search]).order("name")
    else
      @drinks = @drinks.order(created_at: :desc)
    end
  end

  # GET /drinks/1
  # GET /drinks/1.json
  def show
    @drink = Drink.find_by_id(params[:id])
    @user = @drink.user 
  end

  # GET /drinks/new
  def new
    @drink = current_user.drinks.new
  end

  # GET /drinks/1/edit
  def edit

  end

  def get_venues
    id = ENV['FOURSQUARE_CLIENT_ID']
    secret = ENV['FOURSQUARE_CLIENT_SECRET']
    client = Foursquare2::Client.new(client_id: id, client_secret: secret)
    response = client.search_venues(ll: "#{params[:lat]}, #{params[:long]}")
    @venues = response["venues"]
    render json: @venues
  end

  # POST /drinks
  # POST /drinks.json
  def create
    # raise params.to_json
    @drink = current_user.drinks.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to @drink, notice: 'Drink was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drink }
      else
        format.html { render action: 'new' }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinks/1
  # PATCH/PUT /drinks/1.json
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.html { redirect_to @drink, notice: 'Drink was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1
  # DELETE /drinks/1.json
  def destroy
    @drink.destroy
    respond_to do |format|
      format.html { redirect_to drinks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_params
      params.require(:drink).permit(:name, :price, :city, :location, :description, :references, :image, :user_id, :lat, :long)
    end
end
