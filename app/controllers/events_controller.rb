class EventsController < ApplicationController
    before_action :get_event, :only => [:show, :edit, :update, :delete]
    # GET /events/index
    # GET /events
    def index
        # @events = Event.all
        @events = Event.page(params[:page]).per(10)
    end

    # GET /event/new
    def new
        @event = Event.new
    end
    # POST /event/create
    def create
        @event = Event.new(event_params)
        if @event.save
            flash[:notice] = "新增成功"
            redirect_to :action=>:index
        else
            render :action=>:new
        end
    end 
    # GET /event/show
    def show
        @page_title = @event.name
    end
    # GET /event/edit
    def edit
    end
    # POST /event/update
    def update
        if @event.update(event_params)
            flash[:notice] = "编辑成功"
            redirect_to :action => :show, :id => @event
        else
            render :action=>:edit # scaffold 里有报错的css样式
        end

    end
    # GET /event/delete
    def delete
        @event.destroy
        flash[:alert] = "删除成功"
        redirect_to :action => :index
    end
    private
    def event_params
        params.require(:event).permit(:name, :description)
    end
    def get_event
        @event = Event.find(params[:id])
    end

end
