class MainController < ApplicationController
  def login
  end

  def create
    u = User.where(email: params[:email]).first
    if u and u.authenticate(params[:password])
      redirect_to main_path
      session[:id] = u.id
      session[:logged_in] = true
    else
      redirect_to login_path, notice: 'your username or your password is wrong. please try again!'
    end
  end

  def destroy
    reset_session
  end

  def home
    must_be_logged_in
    @role = role?
    @id = session[:id]
  end

  def profile
    must_be_logged_in
  end

  def market
  end

  def phistory
    must_be_logged_in
  end

  def shistory
    must_be_logged_in
  end

  def inventory
    must_be_logged_in
  end

  def topseller
    must_be_logged_in
  end
end
