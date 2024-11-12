<<<<<<< HEAD
require('dotenv').config();

const razorpay = require('razorpay');

const instance = new razorpay({
    key_id: process.env.key_id,
    key_secret: process.env.key_secret
=======
const razorpay = require('razorpay');

const instance = new razorpay({
    key_id: 'rzp_test_09AVqbkjcSmzKv',
    key_secret: 'D9vu4DHGVeLiJBuibKYdBPiw'
>>>>>>> 515f3ae8cecc2da08900d249c85b6309f559b871
});

module.exports = instance;