gulp = require 'gulp'
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'
sass = require 'gulp-sass'
uglify = require 'gulp-uglify'

gulp.task 'sass', () ->
	gulp.src './sass/master.scss'
	.pipe sass
		outputStyle: 'compressed'
	.pipe gulp.dest './src'

gulp.task 'default', () ->
	gulp.src './src/main.coffee'
	.pipe coffee
		bare: true
	.pipe gulp.dest './src'
	.pipe uglify
		preserveComments: 'some'
	.pipe rename 'main.min.js'
	.pipe gulp.dest './src'

gulp.task 'watch', () ->
	gulp.watch './src/main.coffee', ['default']