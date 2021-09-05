const express = require('express')
require('./db/mongoose')
const userRouter = require('./routers/user')
const carbonDataRouter = require('./routers/carbonData')

const app = express()
const port = process.env.PORT || 3000

// app.use((req, res, next) => {
//     res.status(503).send('Under Maintenance')
// })

app.use(express.json())
app.use(userRouter)
app.use(carbonDataRouter)

app.listen(port, () => {
    console.log('Server is up on port ' + port);
})
