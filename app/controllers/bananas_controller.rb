class BananasController < ApplicationController
  before_action :set_banana, only: [:show, :edit, :update, :destroy]
  around_action :log_everything, only: :index

  # GET /bananas
  # GET /bananas.json
  def index
    @bananas = Banana.all
  end

  # GET /bananas/1
  # GET /bananas/1.json
  def show
  end

  # GET /bananas/new
  def new
    @banana = Banana.new
  end

  # GET /bananas/1/edit
  def edit
  end

  # POST /bananas
  # POST /bananas.json
  def create
    @banana = Banana.new(banana_params)

    respond_to do |format|
      if @banana.save
        format.html { redirect_to @banana, notice: 'Banana was successfully created.' }
        format.json { render :show, status: :created, location: @banana }
      else
        format.html { render :new }
        format.json { render json: @banana.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bananas/1
  # PATCH/PUT /bananas/1.json
  def update
    respond_to do |format|
      if @banana.update(banana_params)
        format.html { redirect_to @banana, notice: 'Banana was successfully updated.' }
        format.json { render :show, status: :ok, location: @banana }
      else
        format.html { render :edit }
        format.json { render json: @banana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bananas/1
  # DELETE /bananas/1.json
  def destroy
    @banana.destroy
    respond_to do |format|
      format.html { redirect_to bananas_url, notice: 'Banana was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_banana
    @banana = Banana.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def banana_params
    params.fetch(:banana, {})
  end

  def log_everything
    log_headers
    yield
  ensure
    log_response
  end

  def log_headers
    http_envs = {}.tap do |envs|
      request.headers.each do |key, value|
        envs[key] = value if key.downcase.starts_with?('http')
      end
    end

    logger.info "Received #{request.method.inspect} to #{request.url.inspect} from #{request.remote_ip.inspect}. Processing with headers #{http_envs.inspect} and params #{params.inspect}"
  end

  def log_response
    logger.info "Responding with #{response.status.inspect} => #{response.body.inspect}"
  end
end
