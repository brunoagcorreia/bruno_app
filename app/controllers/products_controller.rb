class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  #added to limite actions to admin. without it, users can edit the products using the right link
  before_action only: [:new, :edit, :update, :destroy] do
    redirect_to products_path, alert: "No soup for you. You not admin" unless current_user && current_user.admin
  end

  # GET /products
  # GET /products.json
  def index
    #search engine + pagination of itens
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term).paginate(:page => params[:page]).per_page(4)
      logger.debug "Product: #{@products}"
    else
      @products = Product.paginate(:page => params[:page]).per_page(4)
      logger.debug "Product: #{@products}"
    end
  end


  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC").page(params[:page]).per_page(3)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        # format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        # format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.html { redirect_to products_url, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :brand, :description, :image_url, :price)
    end
end
