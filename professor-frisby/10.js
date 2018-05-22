const { Map, List } = require('immutable-ext')

const Sum = x =>
({
  x,
  concat: ({x: y}) => Sum(x + y),
  inspect: () => `Sum(${x})`
})

Sum.empty = () => Sum(0)

const res = List.of(1,2,3).foldMap(Sum, Sum.empty())

console.log(res)
