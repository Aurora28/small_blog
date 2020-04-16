class EventsController < ApplicationController
    # GET /events/index
    # GET /events
    def index
        @events = Event.all
    end

    # GET /event/new
    def new
        @event = Event.new
    end
    # POST /event/create
    def create
        @event = Event.new(event_params)
        @event.save

        redirect_to :action=>:index
    end 
    # GET /event/show
    def show
        @event = Event.find(params[:id])
    end
    # GET /event/edit
    def edit
        @event = Event.find(params[:id])
    end
    # POST /event/update
    def update
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to :action => :show, :id => @event
    end
    # GET /event/delete
    def delete
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to :action => :index
    end
    private
    def event_params
        params.require(:event).permit(:name, :description)
    end

end
