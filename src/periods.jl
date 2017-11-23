function findperiod(cf::PartialQuotients)
  return 0
end

"""
sqrt(n) = [a0; a1 a2 ... a2 a1 2*a0 a1 a2...] with period "a1 a2 ... a2 a1 2*a0".
"""
function findperiod(cf::PartialQuotients{QuadraticIrrational})
  frac = cf.partialquotients
  len = length(frac)
  (len < 2) && return 0
  (frac[end] != 2 * frac[1]) && return 0
  stop = false
  period_len = (len % 2 == 0) ? 1 : 2
  i = 1
  while !stop
    if 1 + i < len - i
      if frac[1 + i] != frac[len - i]
        return 0
      end
      period_len += 2
    else
      stop = true
    end
    i += 1
  end
  return period_len
end
