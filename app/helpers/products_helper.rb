module ProductsHelper
  def integer_or_float
    if @product.selling_price.to_s[-2..-1] == ".0"
      @product.selling_price.to_i
    else
      @product.selling_price
    end
  end
end
