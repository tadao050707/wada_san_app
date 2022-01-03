class ProductsController < ApplicationController
  before_action :set_product, only: %i[ edit update ]

  def index
    @products = Product.all # .order(created_at: :desc)
    # @tasks = @tasks.order_tasks if params[:sort_expired].present?
    # @tasks = @tasks.order_priorities if params[:sort_priority].present?
    # @tasks = @tasks.search_title(params[:title]) if params[:title].present?
    # @tasks = @tasks.search_status(params[:status]) if params[:status].present?
    # @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params) # productsはhas_many :products
    # @product = Product.new(product_params)
    # @product.user_id = current_user.id
    if @product.save
      redirect_to edit_product_path(@product.id), notice: "商品を登録しました！"
    else
      render :new
    end    
  end
  
  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to edit_product_path(@product.id), notice: "商品を編集しました！"
    else
      render :edit
    end
  end

  def show
    
  end

  def destroy
    
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:code, :name, :remarks, :regular_price, :selling_price, :cost_price)
  end
end