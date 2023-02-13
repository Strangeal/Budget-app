class DealingsController < ApplicationController

  def index
    @categories = Category.find_by(id: params[:id]) # .where(category_id: @categories)
    @category_dealings = CategoryDealing.includes(:dealing).where(category_id: @categories)
    # @dealing = Dealing.includes(:category_dealings)
   end

  def new
    @dealing = Dealing.new
    @categories = Category.where(author: current_user)
  end

  def create
    @dealing = Dealing.new(dealing_params)
    @dealing.author = current_user
    if @dealing.save
      CategoryDealing.create(dealing_id: @dealing.id, category_id: params[:category])
      redirect_to category_dealings_path(current_user.id), notice: 'Expense added successfully'
    else 
      render :new
    end
  end

  private
  def dealing_params
    params.require(:dealing).permit(:name, :amount, :category)
  end
end
