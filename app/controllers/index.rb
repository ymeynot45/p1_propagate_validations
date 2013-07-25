get '/' do
  @events = Event.all
  # @time =Chronic.parse '2/10/1985'
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :event_new
end

post '/events/create' do
  event = Event.new(params[:event])
  if event.valid?
    event.
    event.save
    redirect to "/"
  else
    @errors = event.errors.messages
    erb :event_new
  end

end
