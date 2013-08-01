#TO DO - post on socrates

get '/' do
  @events = Event.all
  erb :index
end

get '/events/new' do
  @event = Event.new
  erb :event_new
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

post '/events/create' do
  @event = Event.new(params[:event])
  date = params[:event][:date]
  date = Chronic.parse(date, context: :future)
  @event.date = date
  if @event.valid?
    @event.save
    redirect to "/"
  else
    erb :event_new
  end

end
