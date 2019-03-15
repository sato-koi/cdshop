class CdReviewsController < ApplicationController
  before_action :set_cd, only: :new
  def new
    @cd_review = Cd_review.new
  end
  
  def create
    @cd_review = Cd_review.new(cd_review_params)
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
  
  private  
  
  def review_params
    params.require(:cd_review).permit(:title, :body, :evaluation)
  end

  def set_cd
    @cd = Cd.find(params[:cd_id])
  end
end
