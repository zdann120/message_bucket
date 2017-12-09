class BucketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]

  # GET /buckets
  # GET /buckets.json
  def index
    @buckets = current_user.buckets.all
    authorize @buckets
  end

  # GET /buckets/1
  # GET /buckets/1.json
  def show
  end

  # GET /buckets/new
  def new
    @bucket = Bucket.new
    authorize @bucket
  end

  # GET /buckets/1/edit
  def edit
  end

  # POST /buckets
  # POST /buckets.json
  def create
    @bucket = current_user.buckets.new(bucket_params)
    authorize @bucket

    respond_to do |format|
      if @bucket.save
        format.html { redirect_to @bucket, notice: 'Bucket was successfully created.' }
        format.json { render :show, status: :created, location: @bucket }
      else
        format.html { render :new }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buckets/1
  # PATCH/PUT /buckets/1.json
  def update
    respond_to do |format|
      if @bucket.update(bucket_params)
        format.html { redirect_to @bucket, notice: 'Bucket was successfully updated.' }
        format.json { render :show, status: :ok, location: @bucket }
      else
        format.html { render :edit }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckets/1
  # DELETE /buckets/1.json
  def destroy
    @bucket.destroy
    respond_to do |format|
      format.html { redirect_to buckets_url, notice: 'Bucket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket
      @bucket = Bucket.find_by_token(params[:id])
      authorize @bucket
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_params
      params.require(:bucket).permit(:title)
    end
end
