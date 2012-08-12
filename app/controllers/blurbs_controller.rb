class BlurbsController < ApplicationController
	# /cases/:case_id/blurbs(.:format)
  def create
    @case = Case.find(params[:case_id])
    @blurb = @case.blurbs.create(params[:blurb])
    redirect_to case_path(@case)
  end
end
