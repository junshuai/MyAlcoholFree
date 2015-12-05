class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if @cart.line_items.empty?
      redirect_to store_url, notice: 'Your cart is empty'
      return
    end

    @order = Order.new
    @customer = User.find(session[:user_id]).customer
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        send_order_to_suppliers(@order)

        format.html { redirect_to store_url, notice: 'Thank you for your order.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to new_order_url, notice: 'Failed to place order!' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :address, :email, :pay_type)
    end

    def send_order_to_suppliers(order)
      require 'net/http'

      suppliers = {'apple'  => 'http://boiling-lake-3463.herokuapp.com',
                   'banana' => 'http://salty-wave-4297.herokuapp.com'}

      line_items = LineItem.where(order_id: "#{@order.id}")

      order_json = ActiveSupport::JSON.encode(order)

      suppliers.each do |supplier_name, supplier_url|
        uri = URI(supplier_url + '/orders')

        # Construct json string for items
        items_json = '['
        line_items.each do |line_item|
          product = Product.find(line_item.product_id)
          if product.supplier == supplier_name
            items_json << "{\"title\": \"#{product.title}\","
            items_json << " \"price\": \"#{product.price}\","
            items_json << " \"quantity\": \"#{line_item.quantity}\"},"
          end
        end
        items_json[-1] = ']'

        # If not including any products for this supplier, then do not send an order
        if items_json == ']'
          next
        end

        res = Net::HTTP.post_form(uri, 'order' => order_json, 'items' => items_json)
        res.code
      end
    end
end
