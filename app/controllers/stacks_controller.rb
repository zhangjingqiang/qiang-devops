class StacksController < ApplicationController
  before_action :set_stack, only: [:show, :update, :destroy]

  # GET /stacks
  def index
    @stacks = Stack.select("id, title").all
    render json: @stacks.to_json
  end

  # GET /stacks/1
  def show
    @stack = Stack.find(params[:id])
    render json: @stack.to_json(:include => { :skills => { :only => [:id, :description] }})
  end

  # POST /stacks
  def create
    @stack = Stack.new(stack_params)

    if @stack.save
      render json: @stack, status: :created, location: @stack
    else
      render json: @stack.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stacks/1
  def update
    if @stack.update(stack_params)
      render json: @stack
    else
      render json: @stack.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stacks/1
  def destroy
    @stack.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack
      @stack = Stack.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stack_params
      params.require(:stack).permit(:title, :description)
    end
end
