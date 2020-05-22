module RealHelper
  def sortcheck(p, d)
    lposi = current_user.reals.where(start_time: d, position: 1..p)
    @lposi = lposi.minimum("position")
    if p != 1
      mposi = current_user.reals.where(start_time: d, position: 1..p - 1)
      @mposi = mposi.where(position: mposi.maximum("position"))
    else
      @mposi = current_user.reals.where(position: 1)
    end
  end
end
