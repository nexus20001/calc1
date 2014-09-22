class CalculatorController < ApplicationController
  def index

  end
  def calculate
    @user = current_user
    @result = check_perms
  end
  private
  def check_perms
    return _run if @user.admin? and @user.able_admin?(params[:expression])
    _run if @user.able?(params[:expression]) and @user.correct_value?(params[:expression])
  end

  def _run
     eval("%s" % [ params[:expression]]).to_f
  end
end
