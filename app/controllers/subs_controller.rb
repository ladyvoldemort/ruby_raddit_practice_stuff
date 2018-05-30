class SubsController < ApplicationController
  before_action, find_sub except: [:index, :create]
  after_action :more_cowbell
  # OR before_action :find_sub, only: [:show, :edit, :update, :destroy]
  #xyz controller action
  #tehse are callback methods, to be done before/during/after

  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render partial: "form"
  end

  def create
    @sub = Sub.new(sub_params)
  end


  def edit
    render partial: "form"

  end

  def update
      if @sub.update
        #raisl is smart enough to know if we pass @sub, go to @sub show page
        redirect_to @sub
      else
        # render does not cause a refresh, simply rerender the form
        render :edit
      end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy
    redirect_to subs_path
  end


  private

  def find_sub
    @sub = Sub.find(params[:id])
  end

  def more_cowbell
    Rails.logger.info "DING DING DING DING"
  end


  def sub_params
    params.require(:sub).permit(:name)
  end

end
