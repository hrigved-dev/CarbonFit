const mongoose = require('mongoose');

const offsetDataSchema = new mongoose.Schema({
    Name: {
        type: String,    
    },
    Id: {
        type: String,
    },
    Brief: {
        type: String,
    },
    Min: {
        type: String,
    },
    Availability: {
        type: String,
    },
    Link: {
        type: String,
    },
    Image: {
        type: String,
    }
})
const OffsetData = mongoose.model('OffsetData', offsetDataSchema)

module.exports = OffsetData