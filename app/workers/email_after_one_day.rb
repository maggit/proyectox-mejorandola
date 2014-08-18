class EmailAfterOneDay
  include Sidekiq::Worker
  def perform(student_id)
    student = Student.find student_id
    if student.present?
      StudentMailer.after_one_day_notification(student).deliver
    end
  end
end