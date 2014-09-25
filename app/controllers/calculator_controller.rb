class CalculatorController < ApplicationController
  def index

  end

  def calculate
    @result = check_perms
    # render text: @result
  end

  private

  def check_perms
    return _run if current_user.admin? and current_user.able_admin?(params[:expression])
    return _run if current_user.able?(params[:expression]) and current_user.correct_value?(params[:expression])
    "error"
  end

  def _run
     eval("%s" % [ params[:expression]]).to_f
  end
end
