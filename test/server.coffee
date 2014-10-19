"use strict"

################
### REQUIRES ###
################

should  = require('should')
assert  = require("assert")
request = require("supertest")
request = request('http://localhost:3000')

#############
### TESTS ###
#############

describe "GET sur /files", ->

  it "doit retourner un json et être une 200", (done) ->
    request.get('/files').set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200, done)

  it "contient un objet avec name et created_at", (done) ->
    request.get('/files').end (err, res) ->
      body = res.body
      body.should.be.an.instanceOf Object
      body.should.have.property "name"
      body.name.should.equal "Exemple d'un fichier"
      body.should.have.property "created_at"
      done()

describe "GET /trololol", ->

  it "doit retourner un json et être une 404", (done) ->
    request.get("/trololol").set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(404, done)
