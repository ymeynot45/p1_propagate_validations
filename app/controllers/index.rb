#TO DO
# Set up chronic to invalidate old dates when you create an event.
# Put said errors into the event.errors.messages
#

get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  @event = Event.new
  erb :event_new
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
