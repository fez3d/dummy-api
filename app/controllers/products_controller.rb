class ProductsController < ApplicationController
  before_action :set_product, only: [:edit]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    format.json {render json:, status 200}
  end

  # GET /products/1
  # GET /products/1.json
  def show
    begin
      @product = Product.find(params[:id])
      format.html { redirect_to @product, notice: 'Product was successfully created.' }
      format.json { render :show, status: 201, location: @product }
    rescue ActiveRecord::RecordNotFound
      format.json { render json:, status: 404 }
    end
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
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json:, status: 201, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: 422 }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    
    begin
      @product = Product.find(params[:id])
      respond_to do |format|
        if @product.update(product_params)
          format.html { redirect_to @product, notice: 'Product was successfully updated.' }
          format.json { render :show, status: 200, location: @product }
        else
          format.html { render :edit }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
      rescue ActiveRecord::RecordNotFound
        format.json { render json:, status: 404 }
      end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    begin
    @product = Product.find(params[:id]
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { render json: status:204 }
    end
    rescue ActiveRecord::RecordNotFou
      format.json { render json:, status: 404 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
