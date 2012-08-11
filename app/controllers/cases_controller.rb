class CasesController < ApplicationController
  def index
    @cases = Case.all
  end

  def new
    @case = Case.new
  end

  def edit
    @case = Case.find(params[:id])
  end

  def show
    @case = Case.find(params[:id])
  end

  def create
    @case = Case.new(params[:case])

    if @case.save
      redirect_to @case, notice: 'Case successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @case = Case.find(params[:id])

    if @case.update_attributes(params[:case])
      redirect_to @case, notice: 'Case successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @case = Case.find(params[:id])
    @case.destroy

    redirect_to cases_url
  end
end
