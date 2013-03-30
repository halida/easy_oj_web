class SolutionsController < ApplicationController
  before_filter :auth, only: [:new, :create]

  def all
    @all = true
    @solutions = Solution.order('id desc').paginate(page: (params[:page] || 1))
    render "index"
  end

  def ladder
    raw = Solution.where(status: "Accepted").map{|s| [s.user_id, s.problem_id]}.uniq
    result = Hash.new 0
    raw.each{|r| result[r[0]] += 1}
    @result = result.to_a.map{|user_id, count| [User.find(user_id), count, 0]}
  end

  def index
    @all = false
    @solutions = current_user.solutions.order('id desc').paginate(page: (params[:page] || 1))

    respond_to do |format|
      format.html
      format.json { render json: @solutions }
    end
  end

  def show
    @solution = Solution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @solution }
    end
  end

  def new
    @solution = Solution.new
    @solution.language = 'Python'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @solution }
    end
  end

  def create
    @problem = Problem.find params[:solution][:problem_id]
    @solution = @problem.solutions.by_user(current_user).new(params[:solution].slice(:code, :language))

    respond_to do |format|
      if @solution.save
        SolutionChecker.new.perform(@solution.id)
        format.html { redirect_to solutions_path, notice: 'Solution was successfully created.' }
        format.json { render json: @solution, status: :created, location: @solution }
      else
        format.html { render action: "new" }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def auth
    authorize! :create, Solution
  end

end
