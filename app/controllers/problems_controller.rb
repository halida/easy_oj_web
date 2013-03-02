class ProblemsController < ApplicationController
  before_filter :get_challenge

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
    @problem = @challenge.where(user: current_user).problems.new

    respond_to do |format|
      format.html
      format.json { render json: @problem }
    end
  end

  def edit
    @problem = @challenge.where(user: current_user).problems.find(params[:id])
  end

  def create
    @problem = @challenge.where(user: current_user).problems.new(params[:problem])

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
    @problem = @challenge.where(user: current_user).problems.find(params[:id])

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
    @problem = @challenge.where(user: current_user).problems.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :no_content }
    end
  end

  private

  def get_challenge
    @challenge = Challenge.find(params[:challenge_id])
  end
end
