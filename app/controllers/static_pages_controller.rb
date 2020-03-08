class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @demands = Demand.includes(:province, :district).limit Settings.num_demand
    @teachers = Teacher.includes(user: [:avatar_attachment]).limit Settings.num_teacher
  end
end
