class ProblemsController < ApplicationController
  before_filter :get_challenge
  before_filter :auth, only: [:new, :edit, :create, :update]

  def index
    @problems = @challenge.problems.order('id asc')

    respond_to do |format|
      format.html
      format.json { render json: @problems }
    end
  end

  def show
    @problem = @challenge.problems.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @problem }
    end
  end

  def new
    @problem = @challenge.problems.new

    respond_to do |format|
      format.html
      format.json { render json: @problem }
    end
  end

  def edit
    @problem = @challenge.problems.find(params[:id])
  end

  def create
    @problem = @challenge.problems.new(postparams)
    @problem.user = current_user

    respond_to do |format|
      if @problem.save
        format.html { redirect_to [@challenge, @problem], notice: 'Problem was successfully created.' }
        format.json { render json: @problem, status: :created, location: @problem }
      else
        format.html { render action: "new" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @problem = @challenge.problems.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        format.html { redirect_to [@challenge, @problem], notice: 'Problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @problem = @challenge.problems.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to @challenge }
      format.json { head :no_content }
    end
  end

  private

  def get_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end

  def postparams
    params[:problem]
  end

  def auth
    authorize! :manage, @challenge
  end
end
