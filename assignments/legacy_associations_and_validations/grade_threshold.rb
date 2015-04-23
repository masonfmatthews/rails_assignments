class GradeThreshold < ActiveRecord::Base
  belongs_to :course

  def clone
    dup
  end
end
