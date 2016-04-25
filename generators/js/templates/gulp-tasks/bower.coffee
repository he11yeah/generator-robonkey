fs = require('fs')
cfg = JSON.parse(fs.readFileSync('./config.json'))
gulp = require('gulp')
mainBowerFiles = require('main-bower-files')
flatten = require('gulp-flatten')
changed = require('gulp-changed')
uglify = require('gulp-uglify')

gulp.task 'moveBower', ->
  files = mainBowerFiles(
    base: '../bower_components'
    overrides:<%
for (var i = 0; i < jsScriptsBower.length; i++) {
  switch(jsScriptsBower[i]['key']) {
    case null:
    case undefined:
    case '':
    break;

    case 'react': %>
      '<%= jsScriptsBower[i]["key"] %>': main: [<%= jsScriptsBower[i]["main"] %>]<%
    break;

    default: %>
      '<%= jsScriptsBower[i]["key"] %>': main: '<%= jsScriptsBower[i]["main"] %>'<%
  }
} %>)
  files.push '../src/modernizr/*.js'
  gulp.src(files)
    .pipe(flatten())
    .pipe gulp.dest(cfg.scripts.build_lib)