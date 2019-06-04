process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()

const sass_loader = {options: {
    data: "$safe-area-inset-left: 200px; $another-value: 100px"
}}

environment.loaders.append( "sass-loader", sass_loader

)
