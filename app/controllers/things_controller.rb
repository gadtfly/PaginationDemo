class ThingsController < ApplicationController
  def index
    @things = Thing.paginate(page: params[:page], per_page: params[:per_page])
  end
end
