class StoreController < ApplicationController
  skip_before_action :authorize

  def index
    if params[:query]
      @products = Product.where(["title LIKE ?", "%#{params[:query]}%"])
                         .paginate(page: params[:page], per_page: 9)
                         .order(:title)
      if request.xhr?
        render object: @products, layout: false
      else
        render 'index'
      end
    else
      @products = Product.paginate(page: params[:page], per_page: 9).order(:title)
    end
  end
end
