class ExpensesController < ApplicationController

  before_action :authenticate_user!

  def index
    if params[:category_id]
      if params[:category_id] != "" && params[:concept] != ""
        @expenses=current_user.expenses.select {|i| i.category_id==params[:category_id].to_i && i.concept.upcase.include?(params[:concept].upcase)}
      elsif params[:category_id] != "" && params[:concept] == ""
        @expenses=current_user.expenses.where(category_id: params[:category_id])
      elsif params[:category_id] == "" && params[:concept] != ""
        @expenses=current_user.expenses.select {|i| i.concept.upcase.include?(params[:concept].upcase)}
      elsif params[:category_id] == "" && params[:concept] == ""
        @expenses=current_user.expenses
      end
    elsif
      @expenses=current_user.expenses
    end    
  end
end

