type Convergents
  q::PartialQuotients
  accuracy::Int
end

function Convergents(q::PartialQuotients; accuracy = 10)
  if q.accuracy < accuracy && q.periodlength == 0
    # To do : add a warn
    accuracy = q.accuracy
  end
  return Convergents(q, accuracy)
end

function pos2index(period, pos)
  (period == 0) && return pos
  (pos <= period + 1) && return pos
  return 2 + (pos - 2) % period
end

# state = (n, h_{n}, h_{n-1}, k_{n}, k_{n-1})
function Base.start(c::Convergents)
  return (0, big(1), big(0), big(0), big(1))
end

function Base.done(c::Convergents, state)
  return state[1] == c.accuracy
end

function Base.next(c::Convergents, state)
  n, h1, h2, k1, k2 = state
  n += 1
  i = pos2index(c.q.periodlength, n)
  h = c.q.partialquotients[i] * h1 + h2
  k = c.q.partialquotients[i] * k1 + k2
  return h // k, (n, h, h1, k, k1)
end
