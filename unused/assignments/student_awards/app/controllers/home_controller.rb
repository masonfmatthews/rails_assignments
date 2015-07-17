class HomeController < ApplicationController
  def show_everything
    @teachers = Teacher.all
    @new_teacher = Teacher.new
  end

  def show_teacher
    @teacher = Teacher.find(params[:id])
    @new_student = Student.new(teacher_id: @teacher.id)
  end

  def show_student
    @student = Student.find(params[:id])
    @new_award = Award.new(student_id: @student.id)
  end

  def add_teacher
    teacher = Teacher.create!(name: params[:teacher][:name])
    redirect_to home_show_everything_path, notice: "You made #{teacher.name}. Yay!"
  end

  def add_student
    student = Student.create!(name: params[:student][:name],
                              teacher_id: params[:student][:teacher_id])
    teacher = student.teacher
    redirect_to home_show_everything_path, notice: "You added #{student.name} to "+
      "#{teacher.name}'s class. Yay!"
  end

  def add_award
    award = Award.create!(name: params[:award][:name],
                          student_id: params[:award][:student_id],
                          awarded_on: params[:award][:awarded_on])
    student = award.student
    redirect_to home_show_everything_path, notice: "You gave #{student.name} the "+
      " #{award.name} award. Yay!"
  end

  def remove_award
    award = Award.find(params[:id])
    student = award.student
    award.destroy
    redirect_to home_show_everything_path, notice: "You destroyed #{student.name}'s "+
      "hopes and dreams by taking back his #{award.name} award. Jerk."
  end
end
