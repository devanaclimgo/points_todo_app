class TaskController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :toggle]
end