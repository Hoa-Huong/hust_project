class StaticPagesController < ApplicationController
  def home
    @demands = Demand.includes(:province, :district).limit 10
  end
end
