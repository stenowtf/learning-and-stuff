const Box = x =>
({
  fold: f => f(x),
  map: f => Box(f(x)),
  inspect: () => `Box(${x})`
})

// const LazyBox = g =>
// ({
//   fold: f => f(g()),
//   map: f => LazyBox(() => f(g()))
// })

module.exports = Box
