"use strict"

################
### REQUIRES ###
################

require "colors"
express = require("express")
http    = require("http")
morgan  = require("morgan")
util    = require("util")
moment  = require("moment")

#################
### VARIABLES ###
#################

app     = express()
server  = http.createServer(app)
devMode = "development" == app.get("env")

######################
### CONFIGURATIONS ###
######################

app.set("port", process.env.PORT || 3000)

# Log en mode dev ou common
app.use morgan(if devMode then "dev" else "common")

# Voir le HTML indenté dans la source
app.locals.pretty = devMode

##############
### ROUTES ###
##############

app.get "/files/", (req, res) ->
  res.json { name: "Exemple d'un fichier", created_at: moment() }

app.get "*", (req, res) ->
  res.status(404).json { error: "404 : page non trouvée !" }

###############
### SERVEUR ###
###############

server.listen app.get("port"), ->
  msg = util.format "✔︎ Démarrage du serveur sur http://localhost:%d/", app.get("port")
  console.log msg.green
