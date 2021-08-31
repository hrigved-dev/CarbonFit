const mongoose = require('mongoose')
const validator = require('validator')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const CarbonData = require('./carbonData')

const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        trim: true
    },
    email: {
        type: String,
        unique: true,
        required: true,
        trim: true,
        lowercase: true,
        validate(value) {
            if(!validator.isEmail(value)) {
                throw new Error('Invalid Email')
            }
        }
    },
    password: {
        type: String,
        required: true,
        minlength: 7,
        trim: true,
        validate(value) {
            if(value.toLowerCase().includes('password')) {
                throw new Error('Password cannot contain the word password')
            }
        }
    },
    tokens: [{
        token: {
            type: String,
            required: true
        }
    }]
})

//Creating a reference with user and carbonData
userSchema.virtual('carbonData', {
    ref: 'CarbonData',
    localField: '_id',
    foreignField: 'owner'
})

//Token Generation
userSchema.methods.generateAuthToken = async function() {
    const user = this
    const token = jwt.sign({ _id: user._id.toString()}, 'carbonFootprint')

    user.tokens = user.tokens.concat({ token })
    await user.save()

    return token
}

//Abstracting password and tokens
userSchema.methods.toJSON = function() {
    const user = this
    const userObject = user.toObject()

    delete userObject.password
    delete userObject.tokens

    return userObject
}

//Login
userSchema.statics.findByCredentials = async (email, password) => {
    const user = await User.findOne({ email })

    if(!user) {
        throw new Error('Unable to login')
    }

    const isMatch = await bcrypt.compare(password, user.password)

    if(!isMatch) {
        throw new Error('Unable to login')
    }

    return user
}

//Middleware to hash the password
userSchema.pre('save', async function(next) {
    const user = this

    if(user.isModified('password')) {
        user.password = await bcrypt.hash(user.password, 8)
    }

    next()
})

//Middleware for removing all the data if user deletes the profile
userSchema.pre('remove', async function(next) {
    const user = this

    await CarbonData.deleteMany({ owner: user._id })
    next()
}) 

const User = mongoose.model('User', userSchema)

module.exports = User