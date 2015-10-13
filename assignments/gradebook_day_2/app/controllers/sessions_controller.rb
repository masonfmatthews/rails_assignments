class SessionsController < ApplicationController

  def new

  end

  def create
    teacher = Teacher.find_by_email(params[:email])
    if teacher && teacher.authenticate(params[:password])
      session[:teacher_id] = teacher.id
      redirect_to root_path, notice: "You have succesfully logged in!"
    else
      flash.now[:alert] = "Login failed: invalid email or password."
      render "new"
    end
  end

  def destroy
    session[:teacher_id] = nil
    redirect_to login_path, notice: "You have logged out."
  end

end
