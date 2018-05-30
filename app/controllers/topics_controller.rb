class TopicsController < ApplicationController
  before_action :find_sub
  before_action :find_topic, except: [:index, :create]

  def index
    @topics = @sub.topics
  end

  def show
    @topic = Topic.fin(params[:id])
  end

  def new
  end

  def create
    @topic = @sub.topics.new(topic_params)
    if @topic.save
      redirect_to [@sub, @topic]
    else
      render :new
    end
  end

  def edit
    rednr partial: "form"
  end

  def update
    if @topic.update(topic_params)
      redirect_to [@sub, @topic]
    else 
      render :edit
    end
  end

  def destroy
    @topic.delete
    redirect_to sub_topics_path
  end


  private

  def find_sub
    @sub = Sub.find(params[:id])
  end

  def find_topic
    @topic = Topic.fin(params[:id])
  end

end
