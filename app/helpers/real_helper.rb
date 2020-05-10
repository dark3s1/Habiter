module RealHelper
  def sortcheck(p)
    if p != 1
      bposi = p - 1
      @b_real = Real.where(position: bposi)
    else
      @b_real = Real.where(position: p)
    end
  end
end
