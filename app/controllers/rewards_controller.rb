class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy]

  def index
    @rewards = current_user.rewards.order(points_required: :asc)
    @total_points = current_user.tasks.where(completed: true).sum(:points)
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = current_user.rewards.new(reward_params)

    if @reward.points_required < min_reasonable_points
      @reward.errors.add(:points_required, "must be at least #{min_reasonable_points} to be challenging")
      render :new
    elsif @reward.save
      redirect_to rewards_path, notice: 'Reward was successfully created'
    else
      render :new
    end
  end

  private

  def calculate_min_reward_points
    total_possible_points = current_user.tasks.sum(:points)
    (total_possible_points * 0.7).ceil
  end

  def set_reward
    @reward = Reward.find(params[:id])
  end

  def reward_params
    params.require(:reward).permit(:name, :points_required)
  end
end
