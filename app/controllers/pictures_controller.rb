class PicturesController < ApplicationController
  before_action :set_picture,:login_check, only:[:show,:edit,:update,:destroy]

  def index
    login_check
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
     ConfirmMailer.confirm_mail(@picture).deliver
     redirect_to pictures_path, notice: "ブログを作成しました！"
    else
     render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    unless @picture.user.id == current_user.id
      redirect_to pictures_path and return
    end
  end

  def update
    unless @picture.user.id == current_user.id
      redirect_to pictures_path and return
    end
    if @picture.update(picture_params)
     redirect_to user_path(current_user.id), notice: "投稿を作成しました！"
    else
     render 'edit'
    end
  end

  def destroy
    unless @picture.user.id == current_user.id
      redirect_to pictures_path and return
    end
    @picture.destroy
    redirect_to pictures_path,notice:"投稿を削除しました！"
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  private

  def picture_params
    params.require(:picture).permit(:content,:image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def login_check
    unless logged_in?
      redirect_to new_session_path
    end
  end

end
