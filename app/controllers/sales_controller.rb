class SalesController < ApplicationController
  before_action :set_sale, only: %i[ edit update destroy ]

  def index
    @sales = Sale.all # .order(created_at: :desc)
  end

  def new
    @sale = Sale.new
    1.times { @sale.sale_details.build }
  end

  def create
    @sale = current_user.sales.build(sale_params) # salesはhas_many :sales
    # @sale = Sale.new(sale_params)
    # @sale.user_id = current_user.id
    if @sale.save
      redirect_to sales_path, notice: "売上を登録しました！"
    else
      render :new
    end    
  end
  
  def edit
    @sale.sale_details.build
    @products = Sale.find(params[:id]).saled_products
  end

  def update    
    if @sale.update(sale_params)
      redirect_to sales_path, notice: "売上を編集しました！"
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
