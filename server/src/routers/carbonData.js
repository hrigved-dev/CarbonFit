const express = require('express')
const CarbonData = require('../models/carbonData')
const auth = require('../middlewares/auth')
const router = new express.Router()

var total = 0;

//get all carbon data
router.get('/carbon', auth, async (req, res) => {
    try {
        await req.user.populate('carbonDatas').execPopulate()
        res.send(req.user.carbonDatas)
    } catch(e) {
        res.status(500).send()
    }
})

//creation endpoint of transport
//input in Litres/year
router.post('/carbon/transport', auth, async (req, res) => {
    const transportLitre = req.body.transport
    const transportEm = (transportLitre * 2.4745)/1000
    total = total + transportEm

    const carbonData = new CarbonData({
        transport: transportEm,
        total: total,
        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }
})

//update endpoint of transport
router.patch('/carbon/transport', auth, async (req, res) => {

})

//creation endpoint of bus
//input in distance(km) travelled per year
router.post('/carbon/bus', auth, async (req, res) => {
    const busDistance = req.body.bus
    const busEm = (busDistance * 0.1)/1000
    total = total + busEm

    const carbonData = new CarbonData({
        bus: busEm,
        total: total,
        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }
})

//creation endpoint of flights
//input in distance(km) travelled per year
router.post('/carbon/flight', auth, async (req, res) => {
    const flightDistance = req.body.flight
    const flightEm = (flightDistance * 0.1404)/1000
    total = total + flightEm

    const carbonData = new CarbonData({
        flight: flightEm,
        total: total,
        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }    

})

//creation endpoint of train
//input in distance(km) travelled per year
router.post('/carbon/train', auth, async (req, res) => {
    const trainDistance = req.body.train
    const trainEm = (trainDistance * 0.00795)/1000
    total = total + trainEm

    const carbonData = new CarbonData({
        train: trainEm,
        total: total,
        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }    

})

//creation endpoint of lpg
//input in use(kg) per year
router.post('/carbon/lpg', auth, async (req, res) => {
    const lpgUse = req.body.lpg
    const lpgEm = (lpgUse * 2.983)/1000
    total = total + lpgEm

    const carbonData = new CarbonData({
        lpg: lpgEm,
        total: total,
        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }    

})

//creation endpoint of electricity
//input in use(kWh) per year
router.post('/carbon/electricity', auth, async (req, res) => {
    const electricityUse = req.body.electricity
    const electricityEm = (electricityUse * 0.85)/1000
    total = total + electricityEm

    const carbonData = new CarbonData({
        electricity: electricityEm,
        total: total,
        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }
})

//creation endpoint of waste
//input in production(kg) per week
router.post('/carbon/waste', auth, async (req, res) => {
    const wasteProduction = req.body.waste
    const wasteEm = (wasteProduction * 0.086 * 52)/1000
    total = total + wasteEm

    const carbonData = new CarbonData({
        waste: wasteEm,
        total: total,
        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }    

})

//creation endpoint of food
//The emission depends on the food habit
router.post('/carbon/food', auth, async (req, res) => {
    const foodHabit = req.body.food
    var foodEm = 0

    if(foodHabit == "Average Meat Consumption") {
        foodEm = 2.5
    }
    else if(foodHabit == "Meat Lover") {
        foodEm = 3.3
    }
    else if(foodHabit == "No Red Meat") {
        foodEm = 1.9
    }
    else if(foodHabit == "Vegetarian") {
        foodEm = 1.7
    }
    else {
        foodEm = 1.5
    }

    total = total + foodEm

    const carbonData = new CarbonData({
        food: foodEm,
        total: total,
        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }    

})

module.exports = router