// =======================================
// ~Explanation~
// why? to keep functions as pure as possible, bind and unit are used to mutate the inputs (unit) and outputs (bind) of functions to accept or return the desired type.
// bind: changes a function to accept the same type as it returns e.g. (x) => { return [x, '']} to ([x, '']) => { return [x, '']}
// unit: changes a value to the accepted type of the function e.g. converting a String into a [String]
// =======================================

// sine :: Number -> Number
const sine = (x) => { return Math.sin(x) }

// cube :: Number -> Number
const cube = (x) => { return x * x * x }

// round :: Number -> Number
const round = (x) => { return Math.round(x) }

// floor :: Number -> Number
const floor = (x) => { return Math.floor(x) }

// unit :: Number -> Number
const unit = (x) => { return [x, '']}

// compose :: Function -> Function -> (Number, String)
const compose = (f, g) => {
  return (x) => {
    return f(g(x))
  }
}

// bind :: (Number, String) -> (Number, string)
const bind = (f) => {
  return (tup) => {
    let x = tup[0],
        s = tup[1],
        y = f(x),
        yx = y[0],
        ys = y[1]

    return [yx, s + ys]
  }
}

// lift :: (Number, Number) -> (Number -> (Number, String))
const lift = (f) => {
  return (x) => {
    return unit(f(x))
  }
}

const roundDebug = lift(round)

const cubeDebug = lift(cube)

const multi = compose(bind(roundDebug), bind(cubeDebug))

// console.log(compose(multi, unit)(3))

// console.log('Value: ' + compose(f, unit)(3)[0])
// console.log('Log: ' + compose(f, unit)(3)[1])

// =======================================
// =======================================

const data = [{
  title: "info",
  doot: "toot",
  sub: {
    levels: "m8",
    toot: "fam"
  },
  bru: "nah",
  id: 1
},
{
  title: "info",
  doot: "toot",
  sub: {
    levels: "m8",
    toot: "fam"
  },
  bru: "nah",
  id: 2
},
{
  title: "pop pop",
  doot: "toot",
  sub: {
    levels: "m8",
    toot: "fam"
  },
  bru: "nah",
  id: 3
}]

// idTitleArray :: [Object] -> [String]
const idTitleArray = (obj) => {
  let arr = []
  obj.map(o => {
      arr.push(o.id + ': ' + o.title)
    }
  )
  return arr
}

console.log(idTitleArray(data))