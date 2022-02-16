class ToppagesController < ApplicationController
  def index
     if logged_in?
      @review = current_user.reviews.build  # form_with 用
      @pagy, @reviews = pagy(current_user.reviews.order(id: :desc))
     end
  end
end
