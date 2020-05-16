class CardController < ApplicationController
  # show・edit・updateアクションを呼ぶ前にset_cardメソッドを読む
  before_action :set_card, only: %i(show create edit update destroy)
  def new
    @card = Card.new()
    @list = List.find_by(id: params[:list_id])
  end
  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end

  end
  
  # @cardインスタンス変数の定義は削除する
  def show
  end

  # @cardインスタンス変数の定義は削除する
  def edit
    @lists = List.where(user: current_user)
  end
  
  def destroy
    @card.destroy
    redirect_to :root
  end

  # @cardインスタンス変数の定義は削除する
  def update
    if @card.update_attributes(card_params)
      redirect_to :root
    else
      render action: :edit
    end
  end
  
  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id)
    end
    def set_card
      @card = Card.find_by(id: params[:id])
    end
end
