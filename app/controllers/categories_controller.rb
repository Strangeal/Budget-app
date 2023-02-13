class CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:category_dealings)
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

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

end
