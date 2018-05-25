const Box = require('./box')
const Task = require('data.task')
const {List, Map} = require('immutable-ext')

const Right = x =>
({
  chain: f => f(x),
  map: f => Right(f(x)),
  fold: (f, g) => g(x),
  inspect: () => `Right(${x})`
})

const Left = x =>
({
  chain: f => Left(x),
  map: f => Left(x),
  fold: (f, g) => f(x),
  inspect: () => `Left(${x})`
})

const fromNullable = x => x != null ? Right(x) : Left(null)

const res1 = Right('squirrels').map(s => s.substr(5)).map(s => s.toUpperCase())
const res2 = Right('squirrels').map(s => s.substr(5).toUpperCase())

console.log(res1, res2)
