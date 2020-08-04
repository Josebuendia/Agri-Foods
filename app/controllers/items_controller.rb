class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  #after_action :verify_authorized#, except: :index, unless: user_controller?
    #after_action :verify_policy_scoped#,  only: index

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  def search
    st = "%#{params[:q]}%"
    @items = Item.where("title like ?", st)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
   # @items = current_user.item.find(params[:id])
    #@items = current_user.items.find_by_user_id(params[:id])
  #else

     # authorize @item
  end

  # POST /items
  # POST /items.json
  def create
    #changed @item = Item.new(item_params) to Item.create_with(user: current_user).new(item_params) (&& item.save getting rid of this made it work)
    @item = Item.create_with(user: current_user).new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.'}
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    #@item = item.find(params[:id])
        #authorize @item
     #   if
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
   # else
      #flash.now[:alert] = "There was an error deleting the wiki."
     # render :show
    #end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
     # authorize @item
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:title, :description, :price, :image_url, :shelf_life, :category, :county, :farm)
    end
end
