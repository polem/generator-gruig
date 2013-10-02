'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var _ = require('lodash');


var GruigGenerator = module.exports = function GruigGenerator(args, options, config) {
  yeoman.generators.Base.apply(this, arguments);

  this.on('end', function () {
    this.installDependencies({ skipInstall: options['skip-install'] });
  });

  this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
};

util.inherits(GruigGenerator, yeoman.generators.Base);

GruigGenerator.prototype.askFor = function askFor() {
  var cb = this.async();

  // have Yeoman greet the user.
  console.log(this.yeoman);

  var prompts = [{
    name: 'apptitle',
    message: 'App title ?',
  }, {
    type: 'confirm',
    name: 'css_preprocessor_use',
    message: 'Would you like use a css preprocessor ?',
    default: true
  }, {
    name: 'css_preprocessor',
    message: 'Would you use compass or less ?',
    when: function (props) {
      return props.css_preprocessor_use;
    }
  }];

  this.prompt(prompts, function (props) {
    this.css_preprocessor_use = props.css_preprocessor_use;
    this.css_preprocessor = props.css_preprocessor;
    this.apptitle = props.apptitle;

    if(this.css_preprocessor_use && this.css_preprocessor == 'less') {
        this.directory('styles/less', 'app/styles/less');
    }

    if(this.css_preprocessor_use && this.css_preprocessor == 'compass') {
        this.directory('styles/sass', 'app/styles/sass');
    }

    cb();
  }.bind(this));
};

GruigGenerator.prototype.app = function app() {
  this.mkdir('app');
  this.mkdir('app/images');

  this.template('Gruntfile.js', 'Gruntfile.js');
  this.template('component.json', 'component.json');

  this.directory('views', 'app/views');
  this.template('views/_layout.swig', 'views/_layout.swig');
  this.template('views/_header_nav.swig', 'views/_header_nav.swig');

  this.copy('_package.json', 'package.json');
};

GruigGenerator.prototype.projectfiles = function projectfiles() {
  this.copy('editorconfig', '.editorconfig');
  this.copy('jshintrc', '.jshintrc');
  this.copy('bowerrc', '.bowerrc');
};
