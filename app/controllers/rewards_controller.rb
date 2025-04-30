class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy]

  def index
    @rewards = current_user.rewards.order(points_required: :asc)
    @total_points = current_user.tasks.where(completed: true).sum(:points)
  end

  def new
    @reward = Reward.new
  end
end
