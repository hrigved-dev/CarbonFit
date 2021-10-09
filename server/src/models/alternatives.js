const mongoose = require('mongoose');

const alternativesDataSchema = new mongoose.Schema({
    Transport: {
        type: String,
    },
    Lpg:{
        type: String,
    },
    Electricity:{
        type: String,
    },
    Waste:{
        type:String,
    },
    Food:{
        type:String,
    },
})

const alternativesData = mongoose.model('alternativesData', alternativesDataSchema)

module.exports = alternativesData