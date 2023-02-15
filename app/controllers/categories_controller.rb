class CategoriesController < ApplicationController
  def index
    @categories = Category.where(author: current_user).includes(:category_dealings).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.author = current_user
    if @category.save
      redirect_to root_path, notice: 'Category Added successfully'
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_dealings = CategoryDealing.includes(:dealing).where(category: @category)
    @total = 0
    @category_dealings.each { |z| @total += z.dealing.amount}
   end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end
