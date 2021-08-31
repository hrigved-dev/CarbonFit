const express = require('express')
const User = require('../models/user')
const auth = require('../middlewares/auth')
const router = new express.Router()

//creation endpoint for users
router.post('/users', async (req, res) => {
    const user = new User(req.body)

    try {
        await user.save()
        const token = await user.generateAuthToken()
        res.status(201).send({ user, token })
    } catch(e) {
        res.status(400).send(e)
    }
})

//endpoint for logging in
router.post('/users/login', async (req, res) => {
    try {
        const user = await User.findByCredentials(req.body.email, req.body.password)
        const token = await user.generateAuthToken()
        res.send({ user, token })
    } catch(e) {
        res.status(400).send()
    }
})

//endpoint for logging out
router.post('/users/logout', auth, async (req, res) => {
    try {
        req.user.tokens = req.user.tokens.filter((token) => {
            return token.token !== req.token
        })
        await req.user.save()

        res.send()
    } catch(e) {
        res.status(500).send()
    }
})

//endpoint for logging out from all sessions
router.post('/users/logoutAll', auth, async (req, res) => {
    try {
        req.user.tokens = []
        await user.save()

        res.send()
    } catch(e) {
        res.status(500).send()
    }
})

//reading endpoint for a specific user
router.get('/users/me', auth, async (req, res) => {

    res.send(req.user) 

})

//reading endpoint for users
router.get('/users', async (req, res) => {
    try {
        const users = await User.find({})
        res.send(users)
    } catch(e) {
        res.status(500).send()
    }
})

//update endpoint for users
router.patch('/users/me', auth, async (req, res) => {
    const updates = Object.keys(req.body)
    const allowedUpdates = ['name', 'email', 'password']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

    if (!isValidOperation) {
        res.status(400).send({ error: 'Invalid updates!'})
    }

    try {
        
        updates.forEach((update) => req.user[update] = req.body[update])

        await req.user.save()

        // const user = await User.findByIdAndUpdate(_id, req.body, {new: true, runValidators: true})

        res.send(req.user)
    }catch(e) {
        res.status(400).send(e)
    }
})

//deletion endpoints for users
router.delete('/users/me', auth, async (req, res) => {
    try {
        // const user = await User.findByIdAndDelete(req.user._id)

        // if(!user) {
        //     res.status(404).send()
        // }

        await req.user.remove()

        res.send(req.user)
    }catch(e) {
        res.status(500).send()
    }
})

module.exports = router