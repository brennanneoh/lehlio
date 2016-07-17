module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        expand: true
        flatten: false
        cwd: 'src/js'
        src: ['**/*.coffee']
        dest: 'build/js'
        ext: '.js'
    pug:
      compile:
        files:
          'build/index.html': 'src/index.pug'
    connect:
      server:
        options:
          port: 8000
          base: 'build'
    watch:
      coffee:
        files: ["src/js/**/*.coffee"]
        tasks: ['compile:coffee']
      pug:
        files: ['src/**/*.pug']
        tasks: ['compile:pug']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-pug'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'compile', ['coffee', 'pug']
  grunt.registerTask 'server', ['compile', 'connect', 'watch']
