class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def create
    l = League.create(params.permit(:name, :latitude, :longitude, :price_cents))
    respond_to do |format|
      if l.id == nil
        format.json  { render :json => l, status: :unprocessable_entity }
      else
        format.json  { render :json => l, status: :ok }
      end
    end
  end

  def find
    lat = params[:latitude].to_f
    long = params[:longitude].to_f
    radius = params[:radius].to_i
    price_cents = params[:price_cents].to_i

    # Using point-based comparison, which will act up at poles and 180deg longitude.
    # If those cases matter cube-based would be better. Or postgis if we want to get fancy.
    distance = "point '(#{long}, #{lat})' <@> point (longitude, latitude)"
    @leagues = League
        .select("#{League.table_name}.*, point '(#{long}, #{lat})' <@> point (longitude, latitude) AS distance")
        .where("point '(#{long}, #{lat})' <@> point (longitude, latitude) <= ? AND price_cents <= ?", radius, price_cents)
        .all
    respond_to do |format|
      msg = { :status => "ok", :leagues => @leagues }
      format.json  { render :json => msg }
    end
  end

end
