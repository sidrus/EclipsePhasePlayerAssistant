class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @item = Item.new
  end

  def create
    begin
      @pc = current_user.characters.find(params[:char_id])
      redirect_to(characters_url, :error => 'You cannot add items to characters you do not own.') if @pc.nil?

      data = params[:item]
      @item = Item.new()
      @item.name = data[:name]
      @item.description = data[:description]
      @item.item_type = ItemType.find(data[:item_type])

      if @item.save then
        @pc.items << @item
        redirect_to character_inventory_url(@pc)
      else
        render :new if not @item.save
      end
    rescue => exception
      flash[:error] = "Unable to create this item due to an exception: '#{exception.message}'"
      @item = Item.new
      render :new
    end
  end

  def destroy
    begin
      @pc = current_user.characters.find(params[:char_id])
      redirect_to(characters_url, :error => 'You cannot remove items from characters you do not own.') if @pc.nil?

      @item = Item.find(params[:item_id])
      redirect_to(characters_url, :error => 'Unable to locate the item to destroy') if @item.nil?

      @pc.items.delete(@item)
      if @item.destroy then
        flash[:success] = "#{@item.name} deleted."
      else
        flash[:error] = "Could not delete #{@item.name}."
      end

      redirect_to :back
    rescue => exception
      flash[:error] = "Unable to remove this item due to an exception: '#{exception.message}'"
      redirect_to :back
    end
  end

  def clear_all
    begin
      @pc = current_user.characters.find(params[:id])
      redirect_to(characters_url, :error => 'You cannot clear an inventory you do not own.') if @pc.nil?

      @pc.items.delete_all
      @pc.save

      redirect_to :back
    rescue => exception
      flash[:error] = "Unable to remove this item due to an exception: '#{exception.message}'"
      redirect_to :back
    end
  end
end
