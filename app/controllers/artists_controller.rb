class ArtistsController < ApplicationController
    def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to @artist, notice: "アーティストを登録しました。"
    else
      render :new
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artist = Artist.find(params[:id])
  end 

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to @artist, notice: "CD情報を更新しました。"
    else
      render :edit
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :url, :description, :new_image)
  end

end
