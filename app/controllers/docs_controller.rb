class DocsController < ApplicationController
  before_filter :find_case
  skip_before_filter :authorize

  def index
    @docs = @case.docs

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @docs }
    end
  end

  def show
    @doc = @case.docs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @doc }
    end
  end

  def new
    @doc = @case.docs.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @doc }
    end
  end

  def edit
    @doc = @case.docs.find(params[:id])
  end

  def create
    @doc = @case.docs.build(params[:doc])

    respond_to do |format|
      if @doc.save
        format.html { redirect_to case_doc_path(@case, @doc), notice: 'Doc was successfully created.' }
        format.json { render json: @doc, status: :created, location: @doc }
      else
        format.html { render action: "new" }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @doc = @case.docs.find(params[:id])

    respond_to do |format|
      if @doc.update_attributes(params[:doc])
        format.html { redirect_to case_doc_path(@case, @doc), notice: 'Doc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @doc = Doc.find(params[:id])
    @doc.destroy

    respond_to do |format|
      format.html { redirect_to case_docs_url }
      format.json { head :no_content }
    end
  end

  protected
    def find_case
      @case = Case.find(params[:case_id])
    end
end
