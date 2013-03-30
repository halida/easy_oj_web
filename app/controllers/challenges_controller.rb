class ChallengesController < ApplicationController
  load_and_authorize_resource

  def index
    @challenges = Challenge.order('id desc')

    respond_to do |format|
      format.html
      format.json { render json: @challenges }
    end
  end

  def show
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @challenge }
    end
  end

  def new
    @challenge = current_user.challenges.new

    respond_to do |format|
      format.html
      format.json { render json: @challenge }
    end
  end

  def edit
    @challenge = current_user.challenges.find(params[:id])
  end

  def create
    @challenge = current_user.challenges.new(postparams)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge was successfully created.' }
        format.json { render json: @challenge, status: :created, location: @challenge }
      else
        format.html { render action: "new" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @challenge = current_user.challenges.find(params[:id])

    respond_to do |format|
      if @challenge.update_attributes(postparams)
        format.html { redirect_to @challenge, notice: 'Challenge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @challenge = current_user.challenges.find(params[:id])
    @challenge.destroy

    respond_to do |format|
      format.html { redirect_to challenges_url }
      format.json { head :no_content }
    end
  end

  private
  def postparams
    params[:challenge].slice(:name, :desc, :level)
  end

end
