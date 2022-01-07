class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ edit update ]

  def index
    @suppliers = Supplier.all # .order(created_at: :desc)
    # @tasks = @tasks.order_tasks if params[:sort_expired].present?
    # @tasks = @tasks.order_priorities if params[:sort_priority].present?
    # @tasks = @tasks.search_title(params[:title]) if params[:title].present?
    # @tasks = @tasks.search_status(params[:status]) if params[:status].present?
    # @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?
  end

  def new
    @supplier = Supplier.new
  end

  def create
    # @supplier = current_user.suppliers.build(supplier_params)
    @supplier = Supplier.new(supplier_params)
    # @supplier.user_id = current_user.id
    if @supplier.save
      redirect_to edit_supplier_path(@supplier.id), notice: "得意先を登録しました！"
    else
      render :new
    end    
  end
  
  def edit
  end

  def update
    if @supplier.update(supplier_params)
      redirect_to edit_supplier_path(@supplier.id), notice: "得意先を編集しました！"
    else
      render :edit
    end
  end

  def show
    
  end

  def destroy
    
  end

  private
  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:code, :name, :phone_number, :fax_number, :address, :remarks)
  end
end
