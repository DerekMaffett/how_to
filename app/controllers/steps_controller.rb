class StepsController < ApplicationController
  def show
    @list = List.find(params[:list_id])
    @step = @list.steps.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @step = Step.new
  end

  def create
    @list = List.find(params[:list_id])
    @step = @list.steps.build(step_params)
    if @step.save
      redirect_to list_path(@list), notice: 'Step has been created'
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
    @step = @list.steps.find(params[:id])
  end

  def update
    @list = List.find(params[:list_id])
    @step = @list.steps.find(params[:id])
    if @step.update(step_params)
      redirect_to list_path(@list), notice: 'Step has been updated'
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @step = @list.steps.find(params[:id])
    @step.destroy
    redirect_to list_path(@list), notice: 'Step has been removed'
  end

  private

  def step_params
    params.require(:step).permit(:name)
  end
end
