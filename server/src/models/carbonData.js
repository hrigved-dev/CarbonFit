//test
const mongoose = require('mongoose')

const carbonDataSchema = new mongoose.Schema({
    transport: {
        type: Number,
    },
    bus: {
        type: Number,
    },
    flight: {
        type: Number,
    },
    train : {
        type: Number,
    },
    lpg: {
        type: Number,
    },
    electricity: {
        type: Number,
    },
    waste: {
        type: Number,
    },
    food: {
        type: String,
    },
    total: {
        type: Number
    },
    owner: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'User'
    }
})

const CarbonData = mongoose.model('CarbonData', carbonDataSchema)

module.exports = CarbonData