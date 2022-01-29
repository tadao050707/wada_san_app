class SalesController < ApplicationController
  before_action :set_sale, only: %i[ edit update destroy ]

  def index
    @sales = Sale.all # .order(created_at: :desc)
    # @tasks = @tasks.order_tasks if params[:sort_expired].present?
    # @tasks = @tasks.order_priorities if params[:sort_priority].present?
    # @tasks = @tasks.search_title(params[:title]) if params[:title].present?
    # @tasks = @tasks.search_status(params[:status]) if params[:status].present?
    # @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def new
    @sale = Sale.new
    1.times { @sale.sale_details.build }
    # @client = Client.find(1)
    # @product = Product.find(1)
  end

  def create
    @sale = current_user.sales.build(sale_params) # salesはhas_many :sales
    # @sale = Sale.new(sale_params)
    # @sale.user_id = current_user.id
    @product = Product.find(1)
    byebug
    if @sale.save
      redirect_to edit_sale_path(@sale.id), notice: "売上を登録しました！"
    else
      render :new
    end    
  end
  
  def edit
    @sale.sale_details.build
  end

  def update    
    if @sale.update(sale_params)
      redirect_to edit_sale_path(@sale.id), notice: "売上を編集しました！"
    else
      render :edit
    end
  end

  def show
    
  end

  def destroy
    @sale.destroy
    redirect_to sales_path, notice: "売上を削除しました！"
  end

  private
  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:code, :date_at, :inputter, :client_id, sale_details_attributes: [:id, :product_id, :quantity])
  end
end
