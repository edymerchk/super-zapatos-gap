class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @stores = Store.all
  end

  def show
  end

  def new
    @store = Store.new
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      flash[:notice] = "Store was successfully created."
      redirect_to stores_path
    else
      respond_with(@store)
    end

  end

  def update
    if @store.update(store_params)
      flash[:notice] = "Store was successfully updated."
      redirect_to stores_path
    else
      respond_with(@store)
    end
  end

  def destroy
    @store.destroy
    flash[:notice] = "Store was successfully destroyed."
    respond_with(@store)
  end

  private
    def set_store
      @store = Store.find(params[:id])
    end

    def store_params
      params.require(:store).permit(:name, :address)
    end
end
