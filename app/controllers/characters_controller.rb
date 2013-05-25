class CharactersController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def show
    @pc = Character.find(params[:id])
    unless current_user.characters.include?(@pc) then
      redirect_to root_url
    end
  end

  def new
    @character = Character.new
  end

  def create
    @character = current_user.characters.build(params[:character])
    redirect_to @character if @character.save or render :new, error: "Character creation failed."
  end

  # This is really a sub-view of Show.  Calling it in its own action to segregate some variables that only pertain
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
