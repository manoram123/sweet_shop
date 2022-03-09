const mongoose = require('mongoose');

mongoose.connect('mongodb://localhost:27017/SweetShop', {
    useNewUrlParser: true,
    useUnifiedTopology: true
});