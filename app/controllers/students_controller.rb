class StudentsController < ApplicationController
  #before_filter :authenticate_admin!, :except => [:create]

  # POST /students
  # POST /students.json
  def create
    if params[:email].present?
      student = Student.where(:email => params[:email].downcase).first_or_create
      student.city = params[:city]
      if student.save
        StudentMailer.requested_notification(student).deliver
        flash[:notice] =  "Thanks. We will be in touch soon."
        redirect_to root_path(:notice => "Thanks. We will be in touch soon.")
      else
        flash[:error] = "You need to include both users to match"
        redirect_to root_path(:error => "Ooops! #{student.errors.full_messages.join(",")}")
      end
    else
      flash[:error] = "Ooops! We need your email address!"
      redirect_to root_path(:error => "Ooops! We need your email address!")
    end
  end


end