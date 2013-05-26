class CharactersController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def show
    @pc = Character.find(params[:id])

    # set a default tool
    if not defined? @tool then
      @tool = :inventory
    end

    redirect_to characters_url, error: 'You can only view characters you own' unless current_user.characters.include?(@pc)
  end

  def new
    @character = Character.new
  end

  def create
    @character = current_user.characters.build(params[:character])
    if @character.save then
      redirect_to character_inventory_url(@character)
    else
      flash[:error] = 'Character creation failed.'
      render :new
    end
  end

  def update
    @pc = current_user.characters.find(params[:id])
    redirect_to characters_url, error: "You can't adjust any settings for #{@pc.name}." if @pc.nil?

    if defined? params[:character][:money] then
      @pc.money += params[:character][:money].to_f
    end

    if defined? params[:character][:notes] then
      @pc.notes = params[:character][:notes]
    end

    @pc.save
    redirect_to :back
  end

  # This is really a 'sub-view' of Show.  Calling it in its own action to segregate some variables that only pertain
  # to this type of view
  def inventory
    # Call the main 'show' implementation to get our base data loaded
    show

    # indicate that we're using the inventory view
    @tool = :inventory

    # display the show view
    render :show
  end

  def notes
    show

    @tool = :notes

    render :show
  end

  def adjust_money
    @pc = current_user.characters.find(params[:id])
    redirect_to characters_url, error: "You can't adjust money for #{@pc.name}." if @pc.nil?


  end

  def destroy
    @pc = current_user.characters.find(params[:id])
    if @pc then
      @pc.destroy
      redirect_to characters_url
    else
      redirect_to characters_url, error: "Unknown character"
    end
  end
end
