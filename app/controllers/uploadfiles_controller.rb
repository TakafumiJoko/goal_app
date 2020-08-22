class UploadfilesController < ApplicationController
  before_action :set_uploadfile, only: [:show, :edit, :update, :destroy]

  # GET /uploadfiles
  # GET /uploadfiles.json
  
  def sample
    @file = Uploadfile.read
  end
  
  def index
    @uploadfiles = Uploadfile.all
  end

  # GET /uploadfiles/1
  # GET /uploadfiles/1.json
  def show
  end

  # GET /uploadfiles/new
  def new
    @uploadfile = Uploadfile.new
  end

  # GET /uploadfiles/1/edit
  def edit
  end

  # POST /uploadfiles
  # POST /uploadfiles.json
  def create
    file = {}
    
    file[:name] = "#{uploadfile_params[:name]}.#{uploadfile_params[:data].original_filename.split('.')[1]}"
    
    file[:data] = uploadfile_params[:data].read
    
    @uploadfile = Uploadfile.new(file)
    
    if @uploadfile.save 
      redirect_to @uploadfile
    else
      render 'new'
    end
    
    # respond_to do |format|
    #   if @uploadfile.save
    #     format.html { redirect_to @uploadfile, notice: 'Uploadfile was successfully created.' }
    #     format.json { render :show, status: :created, location: @uploadfile }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @uploadfile.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /uploadfiles/1
  # PATCH/PUT /uploadfiles/1.json
  def update
    respond_to do |format|
      if @uploadfile.update(uploadfile_params)
        format.html { redirect_to @uploadfile, notice: 'Uploadfile was successfully updated.' }
        format.json { render :show, status: :ok, location: @uploadfile }
      else
        format.html { render :edit }
        format.json { render json: @uploadfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploadfiles/1
  # DELETE /uploadfiles/1.json
  def destroy
    @uploadfile.destroy
    respond_to do |format|
      format.html { redirect_to uploadfiles_url, notice: 'Uploadfile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uploadfile
      @uploadfile = Uploadfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def uploadfile_params
      params.require(:uploadfile).permit(:name, :data)
    end
end
