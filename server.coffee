"use strict"

################
### REQUIRES ###
################

require "colors"
express = require("express")
http    = require("http")
util    = require("util")
moment  = require('moment')

#################
### VARIABLES ###
#################

app = express()
server = http.createServer(app)

######################
### CONFIGURATIONS ###
######################

app.set("port", process.env.PORT || 3000)

##############
### ROUTES ###
##############

app.get "/files/", (req, res) ->
  res.send { name: "Exemple d'un fichier", created_at: moment() }

###############
### SERVEUR ###
###############

server.listen app.get("port"), ->
  msg = util.format "✔︎ Démarrage du serveur sur http://localhost:%d/", app.get("port")
  console.log msg.green
