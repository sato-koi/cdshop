class CdsController < ApplicationController
  def index
    @cds = Cd.all
  end

  def new
    @cd = Cd.new
  end

  def create
    @cd = Cd.new(cd_params)
    if @cd.save
      redirect_to @cd, notice: "CDを登録しました。"
    else
      render :new
    end
  end

  def show
    @cd = Cd.find(params[:id])
  end

  def edit
    @cd = Cd.find(params[:id])
  end 

  def update
    @cd = Cd.find(params[:id])
    if @cd.update(cd_params)
      redirect_to @cd, notice: "CD情報を更新しました。"
    else
      render :edit
    end
  end


  private

  def cd_params
    params.require(:cd).permit(:title, :artist, :price, :release_date, :description, :new_image)
  end
end
