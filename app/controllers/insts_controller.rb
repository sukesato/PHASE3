class InstsController < ApplicationController
  before_action :set_inst, only: [:show, :edit, :update, :destroy]
  before_action :user_exist?, only: [:new, :edit, :show, :destroy]
  before_action :user_equal?, only: [:edit, :destroy]
  
  def index
    @insts = Inst.all
  end
  
  def new
    if params[:back]
      @inst = Inst.new(inst_params)
    else
      @inst = Inst.new
    end
  end
  
  def create
    @inst = Inst.new(inst_params)
    @inst.user_id = current_user.id #現在ログインしているuserのidを、instのuser_idカラムに挿入する
    if @inst.save
      InstMailer.inst_mail(@inst).deliver
      # 一覧画面へ遷移して"インスタを投稿しました！"とメッセージを表示します。
      redirect_to insts_path, notice: "インスタを投稿しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(inst_id: @inst.id)
  end
  
  def edit
  end
  
  def update
    if @inst.update(inst_params)
      redirect_to insts_path, notice: "インスタを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @inst.destroy
    redirect_to insts_path, notice:"投稿を削除しました！"
  end
  
  def confirm
    @inst = Inst.new(inst_params)
    @inst.user_id = current_user.id #現在ログインしているuserのidを、blogのuser_idカラムに挿入する
    render :new if @inst.invalid?
  end
  
  private
  
  def inst_params
    params.require(:inst).permit(:title, :content, :image, :image_cache)
  end
  
  def set_inst
    @inst = Inst.find(params[:id])
  end
  
  def user_exist?
    unless logged_in?
      redirect_to new_session_path
    end
  end
  
  def user_equal?
     unless @inst.user_id == current_user.id
       redirect_to inst_path
     end
  end
  
end