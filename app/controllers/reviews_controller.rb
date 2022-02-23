class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_review, only: [:show, :edit, :update, :destroy]
    
  def index
    @reviews = Review.all
  end

  def show
    # @review = Review.find(params[:id])
  end

  def new
     @review = Review.new
  end

  def create
      @review = current_user.reviews.build(review_params)
      # @review = Review.new(review_params)

    if @review.save
      flash[:success] = 'レビューが正常に投稿されました'
      redirect_to @review
    else
      flash.now[:danger] = 'レビューが投稿されませんでした'
      render :new
    end
  end

  def edit
    # @review = Review.find(params[:id])
  end

  def update
    # @review = Review.find(params[:id])

    if @review.update(review_params)
      flash[:success] = 'レビューは正常に更新されました'
      redirect_to @review
    else
      flash.now[:danger] = 'レビューは更新されませんでした'
      render :edit
    end
  end

  def destroy
    # @review = Review.find(params[:id])
    @review.destroy

    flash[:success] = 'レビューは正常に削除されました'
    redirect_to reviews_url
  end
  
private

  # Strong Parameter
  def set_review
    @review = Review.find(params[:id])
  end
  
  def review_params
    params.require(:review).permit(:title, :text)
  end

end
