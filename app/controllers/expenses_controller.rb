class ExpensesController < ApplicationController
  def index
    
    @expenses=Expense.all
    if params[:category_id] != "" && params[:concept] != ""
      @expenses=Expense.all.select {|i| i.category_id==params[:category_id].to_i && i.concept.upcase.include?(params[:concept].upcase)}
    elsif params[:category_id] != "" && params[:concept] == ""
      @expenses=Expense.where(category_id: params[:category_id])
    elsif params[:category_id] == "" && params[:concept] != ""
      @expenses=Expense.all.select {|i| i.concept.upcase.include?(params[:concept].upcase)}
    end

     
    
  end
end

