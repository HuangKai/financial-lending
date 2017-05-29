var gulp = require('gulp'),
    // revCollector = require('gulp-rev-collector'), //给文件添加时间戳 
    plumber     = require('gulp-plumber'), // 用来检测运行时检测时有没有错误
    sass        = require('gulp-sass'),
    sourcemap   = require('gulp-sourcemaps'),
    minify_css  = require('gulp-minify-css'),
    uglify      = require('gulp-uglify'), // 压缩js文件大小
    clean       = require('gulp-clean'),
    livereload  = require('gulp-livereload'), // 自动刷新
    lazypipe    = require('lazypipe'), // 可以使stream 链分离
    //configuration
    webapp_path = 'public';

var errorHandler = function(err){
  console.log(err);
  this.emit('end');
};

var cssSrc = webapp_path + '/sass/*.scss',
    jsSrc = webapp_path + '/js/**/*.js';

gulp.task('default', ['sass', 'js'], function(){

});


gulp.task('sass', function(){
  var compress = lazypipe().pipe(minify_css, {keepSpecialComments: 0});
  return gulp.src(cssSrc)
    .pipe(plumber(errorHandler))
    .pipe(sourcemap.init())
    .pipe(sass())
    .pipe(compress())
    .pipe(sourcemap.write())
    .pipe(gulp.dest(webapp_path + '/build/css'))
    .pipe(livereload());
});

gulp.task('js', function() {
  return gulp.src(jsSrc)
    .pipe(plumber(errorHandler))
    .pipe(lazypipe().pipe(uglify)())
    .pipe(gulp.dest(webapp_path + '/build/js'))
    .pipe(liverelaod());
});


gulp.task('clean', function() {
  return gulp.src(webapp_path + '/build/js', {read: false})
  .pipe(plumber(errorHandler))
  .pipe(clean({force: true}));
});

gulp.task('watch', ['default'], function () {
  gulp.watch(webapp_path + '/sass/*.scss',      ['sass']);
  gulp.watch(webapp_path + '/src/js/**/*.js',   ['js']);
});
