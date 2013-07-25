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
  erb :event_new
end

post '/events/create' do
  event = Event.new(params[:event])
  date = params[:event][:date]
  if event.valid? && event.valid_date?(date)
    event.save
    redirect to "/"
  else
    @errors = event.errors.messages
    erb :event_new
  end

end
