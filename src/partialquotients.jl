type PartialQuotients{T <: Union{QuadraticIrrational}}
  number::T
  partialquotients::Vector{Int}
  accuracy::Int
  periodlength::Int
end

function PartialQuotients(q::QuadraticIrrational; accuracy = 100)
  continued_frac = PartialQuotients(q, Vector{Int}(), accuracy, 0)
  computepartialquotients!(continued_frac)
  return continued_frac
end

function show(io::IO, cf::PartialQuotients)
  println(io, "Partial quotients of $(cf.number)")
  println(io, " > $(cf.partialquotients)")
  print(io, " > period length is $(cf.periodlength)")
end

function computepartialquotients!(cf::PartialQuotients{QuadraticIrrational})
  x = cf.number
  accuracy = cf.accuracy
  while true
    period = findperiod(cf)
    if accuracy > 0 && period == 0
      partialquotient = Int(floor(eval(x)))
      if eval(x) > partialquotient
        push!(cf.partialquotients, partialquotient)
        next_x = 1 / (x - partialquotient)
      else
        push!(cf.partialquotients, partialquotient)
        cf.periodlength = 0
        return nothing
      end
    else
      cf.periodlength = period
      return nothing
    end
    accuracy -= 1
    x = next_x
  end
end
