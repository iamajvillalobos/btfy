process.env.NODE_ENV = process.env.NODE_ENV || "development";

const dotenv = require("dotenv");
dotenv.config();

const environment = require("./environment");

module.exports = environment.toWebpackConfig();
