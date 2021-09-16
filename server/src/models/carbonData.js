const mongoose = require('mongoose')

const carbonDataSchema = new mongoose.Schema({
    numberofPeople: {
        type: Number,
    },
    transport: {
        type: Number,
    },
    transportEmission: {
        type: Number,      
    },
    bus: {
        type: Number,
    },
    busEmission: {
        type: Number,      
    },
    flight: {
        type: Number,
    },
    flightEmission: {
        type: Number,      
    },
    train : {
        type: Number,
    },
    trainEmission: {
        type: Number,      
    },
    lpg: {
        type: Number,
    },
    lpgEmission: {
        type: Number,      
    },
    electricity: {
        type: Number,
    },
    electriciyEmission: {
        type: Number,      
    },
    waste: {
        type: Number,
    },
    wasteEmission: {
        type: Number,      
    },
    foodEmission: {
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