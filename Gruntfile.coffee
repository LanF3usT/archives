module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    coffeelint:
      app: ["*.coffee", "test/*.coffee"]
      options:
        configFile: "coffeelint.json"

  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.registerTask "default", ["coffeelint"]
