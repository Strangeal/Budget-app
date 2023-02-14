class DealingsController < ApplicationController

  def index
    @category = CategoryDealing.find_by(id: params[:category_id])
    @category_dealings = Category.includes(:dealings).where(id: @category)
    @total = 0
    @category_dealings.each do |u| 
      u.dealings.each { |z| @total += z.amount } 
    end
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
