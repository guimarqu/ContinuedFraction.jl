
# A quadratic irrational : (√a + b)/c
type QuadraticIrrational
  a_square::Integer
  b::Integer
  c::Integer
end

qi_sqrt(a::Integer) = QuadraticIrrational(a, 0, 1)

eval(q::QuadraticIrrational) = (sqrt(q.a_square) + q.b) / q.c

function -(q::QuadraticIrrational, i::Integer)
  return QuadraticIrrational(q.a_square, q.b - q.c * i, q.c)
end

function +(q::QuadraticIrrational, i::Integer)
  return QuadraticIrrational(q.a_square, q.b + q.c * i, q.c)
end

function /(i::Integer, q::QuadraticIrrational)
  # (i*c)/(√a + b) = ((i*c)*(√a + b))/(a - b^2)
  den = q.a_square - q.b^2
  num_f = i * q.c
  common_div = gcd(num_f, den)
  den /= common_div
  num_f /= common_div
  return QuadraticIrrational(num_f^2 * q.a_square, -num_f * q.b, den)
end

function show(io::IO, q::QuadraticIrrational)
  print(io, "(√$(q.a_square) + $(q.b)) / $(q.c)")
end
