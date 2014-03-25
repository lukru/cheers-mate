class LikesController < ApplicationController
  before_action :set_drink

  # GET /likes/new
  def new 
    @like = @drink.likes.new
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = @drink.likes.new
    @like.user = current_user
    @like.save

    respond_to do |format|
      format.html { redirect_to @like.drink, notice: 'Like was successfully created.' }
      format.json { render action: 'show', status: :created, location: @like }
    end
  end

  private

  def set_drink
    @drink = Drink.find(params[:drink_id])
  end
  
end