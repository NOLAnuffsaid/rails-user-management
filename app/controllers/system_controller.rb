class SystemController < ApplicationController
  def health
    render json: {
      status: :up,
      uptime: running_time
    }, status: 200
  end

  private

  def running_time
    Time.now.to_i - UserManagement::HealthCheck::STARTUP_TIME.to_i
  end
end
