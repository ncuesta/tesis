'use strict';

var gulp = require('gulp');
var sass = require('gulp-sass');
var autoprefixer = require('gulp-autoprefixer');
var minifycss = require('gulp-minify-css');
var livereload = require('gulp-livereload');

gulp.task('styles', function() {
  return gulp.src('./styles/**/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest('css'))
    .pipe(autoprefixer({ browsers: ['last 2 versions'], cascade: false }))
    .pipe(minifycss())
    .pipe(livereload());
});

gulp.task('serve', function() {
  var express = require('express');
  var app = express();
  app.use(express.static(__dirname));
  app.listen(8080, '0.0.0.0');
});

gulp.task('watch', function() {
  livereload.listen();
  gulp.watch('./styles/**/*.scss', ['styles']);
  gulp.watch('./*.html', livereload.changed);
});

gulp.task('default', ['serve', 'watch'], function() {});
