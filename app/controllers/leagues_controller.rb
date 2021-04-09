class LeaguesController < ApplicationController

  def index
    @leagues = League.all
    @league = League.new
  end

  def create
    League.create(params.permit(:name, :latitude, :longitude, :price_cents))
    redirect_to action: :index
  end

  def find
  end

  private

  # def league_params
  #   params.require(:league => [:name, :latitude, :longitude, :price_cents])
  #         .permit(:name, :latitude, :longitude, :price_cents)
  # end
end
