# 5.2
# Write a function that takes three arguments. If the first two are zero, return “FizzBuzz.” If the first is zero, return “Fizz.” If the second is zero, return “Buzz.” Otherwise return the third argument. Do not use any language features that we haven’t yet covered in this book.
fizz = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, c -> c
end

# 5.3
# The operator rem(a, b) returns the remainder after dividing a by b. Write a function that takes a single integer (n) and calls the function in the previous exercise, passing it rem(n,3), rem(n,5), and n. Call it seven times with the arguments 10, 11, 12, and so on. You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16.”
calc = fn
  n -> fizz.(rem(n, 3), rem(n, 5), n)
end

IO.write calc.(10)
IO.write calc.(11)
IO.write calc.(12)
IO.write calc.(13)
IO.write calc.(14)
IO.write calc.(15)
IO.write calc.(16)
