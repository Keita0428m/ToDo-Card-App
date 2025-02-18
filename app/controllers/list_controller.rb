class ListController < ApplicationController
  # edit・updateアクションを呼ぶ前にset_listメソッドを読む
  before_action :set_list, only: %i(edit update destroy)

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
  end

  # @listインスタンス変数の定義は削除する
  def edit
  end

  # @listインスタンス変数の定義は削除する
  def update
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  
  def destroy
    @list.destroy
    redirect_to :root
  end

  private
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
    end

    # ここにメソッドを追加する
    def set_list
      @list = List.find_by(id: params[:id])
    end
end