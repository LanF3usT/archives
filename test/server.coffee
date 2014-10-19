"use strict"

################
### REQUIRES ###
################

should  = require('should')
assert  = require("assert")
request = require("supertest")
moment  = require('moment')
request = request('http://localhost:3000')

describe "GET sur /files", ->

  it "doit retourner un json", (done) ->
    request.get('/files').set('Accept', 'application/json')
      .expect('Content-Type', /json/)
    done()

  it "doit avoir un code 200", (done) ->
    request.get('/files').expect(200, done)

  it "contient un objet avec name et created_at", (done) ->
    request.get('/files').end (err, res) ->
      body = res.body
      body.should.be.an.instanceOf Object
      body.should.have.property "name"
      body.name.should.equal "Exemple d'un fichier"
      body.should.have.property "created_at"
      done()
