class StaticPagesController < ApplicationController
  def home
    @demands = Demand.includes(:province, :district).limit Settings.num_demand
    @teachers = Teacher.includes(:user).limit Settings.num_teacher
  end
end
