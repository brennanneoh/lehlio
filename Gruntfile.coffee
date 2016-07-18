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
    sass:
      compile:
        files:
          'build/css/main.css': 'src/css/main.scss'
    copy:
      main:
        files: [
          expand: true
          flatten: true
          src: ['src/imgs/*']
          dest: 'build/imgs/'
          filter: 'isFile'
        ]
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
      sass:
        files: ['src/**/*.scss']
        tasks: ['compile:sass']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-pug'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'compile', ['coffee', 'pug', 'sass', 'copy']
  grunt.registerTask 'server', ['compile', 'connect', 'watch']
