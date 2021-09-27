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

// offsetrouter.route('/offsetData')
// .all((req, res, next) => {
//         res.writeHead(200, {'Content-Type' : 'text/plain'});
//         next();
// })
// .get((req,res, next)=> {
    
//     OffsetData.find({})
//     .then((offsetData)=>{
//         res.statusCode=200;
//         res.setHeader('Content-Type','application/json');
//         res.json(offsetData);
    

//     }, (err) => next(err))
//     .catch((err) =>res.status(400).send(err));
// })
// .post((req,res,next)=> {
//     const Name= req.body.Name
//     const Id = req.body.Id
//     const Brief = req.body.Brief
//     const Min = req.body.Min
//     const Availability = req.body.Availability
//     const Link = req.body.Link

//     print(Name, Id, Brief, Min, Availability, Link)
//     const offsetData = new OffsetData({
//         Name : Name,
//         Id : Id,
//         Brief: Brief,
//         Min : Min,
//         Availability : Availability,
//         Link : Link,
        
//     })
//     .then((offsetData)=>{
//         res.statusCode=200;
//         res.setHeader('Content-Type','application/json');
//         res.json(offsetData);
//         res.statusCode(200)
//     },(err) => next(err))
//     .catch((err) => res.status(404).send(err));
// });

module.exports = router;