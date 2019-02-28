class CdsController < ApplicationController
  def index
    @cds = Cd.all
  end

  def new
    @cds = Cd.new
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

  private

  def cd_params
    params.reqire(:cd).permit(:title, :artist, :price, :release_date, :description)
  end
end