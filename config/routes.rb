Rails.application.routes.draw do
  root 'subs#index'

  resources :subs do
    resources :topics
  end

  scope '/topics/:topic_id', as: 'topic' do
    resources :comments, only: [:new, :create]
  end
  

  get '/people', to: 'people#index', as: 'all_the_people'
  get '/sub/:id', to: 'people#show', as: 'the_one_sub'
  delete '/sub/:id', to: 'people#destroy', as: 'destroy_the_sub'

  

end


#URL -> "localhoest:3000/subs/:sub_id/topics/:topic_id"  Refers to View (below)

#<% link_to "Go to sepcific post", sub_topic_path(@sub, @topic) %>  <<< View. Path to route

#def show
# @sub = Sub.find(params[:sub_id])
# @topic = Topic.find(params[:topic_id])


# Crud actions -> HTTP Request
#Create -> Post
#Read -> Get
#Update -> Put/Patch
#Destroy -> Delete


# Controller Actions-- SQL Query
# index         => @sub = Sub.all
# show          => @sub = Sub.find(params[:id])
# new           => @sub = Sub.new
# Create        => Sub.create(name: 'this is the name')
# edit          => @sub = Sub.find(params[:id])
# Update        = > Sub.find(params[:id]).update(sub_params)
# destroy       => Sub.find(params[:id]).destroy

#   def sub_params
#     params.require(:sub).permit(:name)
#   end


# if all are the same-- use a callback: -> logic to do before/after the controller action
#                                       ->before_action, after_action, before_destroy, etc etc
