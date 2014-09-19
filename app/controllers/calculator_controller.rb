class CalculatorController < ApplicationController
  def index

  end
  def calculate
    @user = current_user
    @result = check_perms
  end
  private
  def check_perms
    return _run if @user.admin? and @user.vuln?(params[:operation])
    _run if @user.able?( params[:value1].to_f , params[:value2].to_f , params[:operation])
  end

  def _run
     eval("%s %s %s" % [ params[:value1].to_f, params[:operation],  params[:value2].to_f]).to_f
  end
end
