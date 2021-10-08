const express = require('express');
const OffsetData = require('../models/offsetData');
const router = new express.Router();

router.post('/offset', async (req, res) => {
    const name = req.body.Name
    const id = req.body.Id
    const brief = req.body.Brief
    const min = req.body.Min
    const availability = req.body.Availability
    const link = req.body.Link

    const offsetData = new OffsetData({
        Name: name,
        Id: id,
        Brief: brief,
        Min: min,
        Availability: availability,
        Link: link
    })

    try {
        await offsetData.save()
        res.status(201).send(offsetData)
    } catch(e) {
        res.status(400).send(e)
    }

})

router.get('/offset', async (req, res) => {
    try {
        const offset = await OffsetData.find({})
        res.send(offset)

    } catch(e) {
        res.status(500).send()

    }
})

module.exports = router;