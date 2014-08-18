class StudentMailer < ActionMailer::Base
  include SendGrid
  sendgrid_category :use_subject_lines
  default from: "mejorandola@maggit.net"

  def requested_notification(student)
    @title = "ProyectoX: Gracias por tu correo"
    @student = student
    mail(to: @student.email, subject: "ProyectoX: Gracias por tu correo")
  end

  def after_one_day_notification(student)
    @title = "ProyectoX: Gracias por tu correo de ayer!"
    @student = student
    mail(to: @student.email, subject: "ProyectoX: Gracias por tu correo de ayer!")
  end

end