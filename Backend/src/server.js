require('dotenv').config();

const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const helmet = require('helmet');
const cors = require('cors');
const mongoose = require('mongoose');
const PORT = process.env.PORT || 5000;
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(morgan("dev"));
app.use(helmet());
app.use(cors());

// MongoDB Connection
mongoose.connect(`mongodb+srv://PIYUSH:${process.env.MONGO_PASSWORD}@cluster0.n0qti.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0`)
    .then(() => console.log("\nConnected to MongoDB"))
    .catch((err) => console.error("MongoDB connection error:", err));

const UserRoutes = require('./routes/user_routes');
app.use('/api/user', UserRoutes);

const CategoryRoutes = require('./routes/category_route');
app.use('/api/category', CategoryRoutes);

const ProductRoutes = require('./routes/product_route');
app.use('/api/product', ProductRoutes);

app.get('/', function (req, res) {
    res.send("Hi I am home page");
});

app.listen(PORT, () => console.log(`Server started at PORT: ${PORT} \n\nURL: http://localhost:${PORT}`));
