class CdReviewsController < ApplicationController
  before_action :set_cd, only: [:show, :new, :edit]
  before_action :set_cd_review, only: [:show, :edit, :update, :destroy]

  def new
    @cd_review = CdReview.new
  end
  
  def create
    @cd_review = CdReview.new(cd_review_params)
    @cd_review.attributes = {
      cd_id: params[:cd_id],
      user_id: current_user.id
    }
    if @cd_review.save
      redirect_to @cd_review.cd, notice: "レビューを登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @cd_review.update(cd_review_params)
      redirect_to @cd_review.cd, notice: "レビューを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @cd_review.destroy
    redirect_to @cd_review.cd, notice: "レビューを削除しました。"
  end
  
  private  
  
  def cd_review_params
    params.require(:cd_review).permit(:title, :body, :evaluation)
  end

  def set_cd
    @cd = Cd.find(params[:cd_id])
  end
  def set_cd_review
    @cd_review = CdReview.find(params[:id])
  end
end
