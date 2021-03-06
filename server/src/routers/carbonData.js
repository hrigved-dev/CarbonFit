const express = require('express')
const CarbonData = require('../models/carbonData')
const auth = require('../middlewares/auth')
const router = new express.Router()

//post carbonData
router.post('/carbon', auth, async (req, res) => {
    var totalEm = 0

    const numberofPeople = req.body.numberofPeople

    const transportLitre = req.body.transport
    const transportEm = (transportLitre * 2.4745 * 52)/1000

    const busDistance = req.body.bus
    const busEm = (busDistance * 0.0025 * 52)/1000  // 0.1/40 (per passenger)

    const flightDistance = req.body.flight
    const flightEm = (flightDistance * 0.1404)/1000

    const trainDistance = req.body.train
    const trainEm = (trainDistance * 0.00795 * 52)/1000

    const lpgUse = req.body.lpg
    const lpgEm = (lpgUse * 2.983 * 12)/(numberofPeople * 1000)

    const electricityUse = req.body.electricity
    const electricityEm = (electricityUse * 0.85 * 12)/(numberofPeople * 1000)  

    const wasteProduction = req.body.waste
    const wasteEm = (wasteProduction * 0.086 * 365)/(numberofPeople * 1000)  

    const foodHabit = req.body.food
    var foodEm = 0

    if(foodHabit == "Non-Vegetarian") {
        foodEm = 0.310
    }
    // else if(foodHabit == "Meat Lover") {
    //     foodEm = 3.3
    // }
    // else if(foodHabit == "No Red Meat") {
    //     foodEm = 1.9
    // }
    else if(foodHabit == "Vegetarian") {
        foodEm = 0.219
    }
    else {
        foodEm = 0.116
    }
    
    totalEm = transportEm + busEm + flightEm + trainEm + lpgEm + electricityEm + wasteEm + foodEm

    const carbonData = new CarbonData({
        numberOfPeople: numberofPeople,

        transport: transportLitre,
        transportEmission: transportEm,

        bus: busDistance,
        busEmission: busEm,

        flight: flightDistance,
        flightEmission: flightEm,

        train: trainDistance,
        trainEmission: trainEm,

        lpg: lpgUse,
        lpgEmission: lpgEm,

        electricity: electricityUse,
        electriciyEmission: electricityEm,

        waste: wasteProduction,
        wasteEmission: wasteEm,

        food: foodHabit,
        foodEmission: foodEm,

        total: totalEm,

        owner: req.user._id
    })

    try {
        await carbonData.save()
        res.status(201).send(carbonData)
    } catch(e) {
        res.status(400).send(e)
    }
})

//get all carbon data
router.get('/carbon', auth, async (req, res) => {
    try {
        await req.user.populate('carbonDatas').execPopulate()
        res.send(req.user.carbonDatas)
    } catch(e) {
        res.status(500).send()
    }
})

//update endpoint
router.patch('/carbon/:id', auth, async (req, res) => {
    const _id = req.params.id
    var totalEm = 0

    const numberofPeople = req.body.numberofPeople

    const transportLitre = req.body.transport
    const transportEm = (transportLitre * 2.4745 * 52)/1000

    const busDistance = req.body.bus
    const busEm = (busDistance * 0.0025 * 52)/1000  

    const flightDistance = req.body.flight
    const flightEm = (flightDistance * 0.1404)/1000

    const trainDistance = req.body.train
    const trainEm = (trainDistance * 0.00795 * 52)/1000

    const lpgUse = req.body.lpg
    const lpgEm = (lpgUse * 2.983 * 12)/(numberofPeople * 1000)

    const electricityUse = req.body.electricity
    const electricityEm = (electricityUse * 0.85 * 12)/(numberofPeople * 1000)  

    const wasteProduction = req.body.waste
    const wasteEm = (wasteProduction * 0.086 * 365)/(numberofPeople * 1000)  

    const foodHabit = req.body.food
    var foodEm = 0

    if(foodHabit == "Non-Vegetarian") {
        foodEm = 0.310
    }
    else if(foodHabit == "Vegetarian") {
        foodEm = 0.219
    }
    else {
        foodEm = 0.116
    }
    
    totalEm = transportEm + busEm + flightEm + trainEm + lpgEm + electricityEm + wasteEm + foodEm

    try {

        const carbonData = await CarbonData.findOne({_id, owner: req.user._id})
        if(!carbonData) {
            res.status(404).send()
        }
        carbonData['numberofPeople'] = numberofPeople
        carbonData['transport'] = transportLitre
        carbonData['transportEmission'] = transportEm
        carbonData['bus'] = busDistance
        carbonData['busEmission'] = busEm
        carbonData['flight'] = flightDistance
        carbonData['flightEmission'] = flightEm
        carbonData['train'] = trainDistance
        carbonData['trainEmission'] = trainEm
        carbonData['lpg'] = lpgUse
        carbonData['lpgEmission'] = lpgEm
        carbonData['electricity'] = electricityUse
        carbonData['electricityEmission'] = electricityEm
        carbonData['waste'] = wasteProduction
        carbonData['wasteEmission'] = wasteEm
        carbonData['food'] = foodHabit
        carbonData['foodEmission'] = foodEm
        carbonData['total'] = totalEm

        await carbonData.save()

        res.send(carbonData)
    } catch(e) {
        res.status(404).send()
    }
})

module.exports = router