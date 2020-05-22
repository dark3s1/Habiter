module HabitsHelper
  def nextcheck(p, d)
    max = current_user.reals.maximum(:position)
    @real_next = current_user.reals.find_by(start_time: d, position: p + 1 ..max)
  end
end
