class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:show, :edit, :update, :destroy]
   # before_action :authenticate_user!, except:  [:index, :show]

  # GET /candidates
  # GET /candidates.json
  def index
    @candidates = Candidate.all

    respond_to do |format|
      format.html
      format.csv { send_data @candidates.to_csv, filename: "candidates-#{Date.today}.csv" }
    end

  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidates = Candidate.all

  end
  def black_list
    @blists = Candidate.where(status: 'Black list')
  end

  def reserved
    @reserveds = Candidate.where(status: 'Reserved')
  end
  def home_list
    @homes = Candidate.where(status: 'Home')
  end
  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  ######################################################################
  def search

    @candidates = Candidate.ransack(name_or_description_or_dev_language_cont: params[:q]).result(distinct: true).limit(3)
    # @q = Candidate.ransack(params[:q])
    # @candidates = @q.result(distinct: true).limit(2)
    

    # respond_to do |format|
    #   format.html{}
    #   format.json{}
    # end
  end
  ######################################################################
  def autocomplete

    # @candidates = Candidate.ransack(name_cont: params[:q]).result(distinct: true).limit(5)
    
    
    respond_to do |format|
      format.html{}
      format.json {}
    end
  end
  #####################################################################

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        
        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1
  # PATCH/PUT /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)

        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { render :show, status: :ok, location: @candidate }

      else
        format.html { render :edit }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: 'Candidate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:name, :description, :image, :level_skills, :dev_language, :suggest_project, :contact_data, :present_job, :expected_salary, :final_salary, :data_from, :cand_comment, :level_language, :document, :status)
    end
end
