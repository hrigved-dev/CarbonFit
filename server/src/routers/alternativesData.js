const express = require('express');
const AlternativesData= require('../models/alternatives');

const router = new express.Router();

router.post('/alternatives', async(req, res)=>{
    const transport = req.body.Transport
    const lpg = req.body.Lpg
    const electricity = req.body.Electricity
    const waste = req.body.Waste 
    const food = req.body.Food 

    const alternativesData = new AlternativesData({
        Transport:transport,
        Lpg:lpg,
        Electricity:electricity,
        Waste: waste,
        Food: food 
    })

    try {
        await alternativesData.save()
        res.status(201).send(alternativesData)
    } catch(e) {
        res.status(400).send(e)
    }
})

router.get('/alternatives', async(req, res)=>{
    try {
        const alternatives = await AlternativesData.find({})
        res.send(alternatives)

    } catch(e) {
        res.status(500).send()

    }
})

module.exports = router;