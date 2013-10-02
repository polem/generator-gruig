<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><%= _.camelize(apptitle) %> - {% block title %} Welcome {% endblock %}</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <!-- build:css({.tmp,<%= yeoman.app %>}) styles/<%= _.slugify(apptitle) %>.css -->
        <link rel="stylesheet" href="styles/main.css">
        <!-- endbuild -->

        <!-- build:js({.tmp,<%= yeoman.app %>}) scripts/vendor/modernizr.js -->
        <script src="components/modernizr/modernizr.js"></script>
        <!-- endbuild -->
    </head>
    <body>

        {% include './_header_nav.swig' %}

        <!--[if lt IE 7]>
            <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

        {% block content %}
            <p>Hello world! This is HTML5 Boilerplate.</p>
        {% endblock %}

        <!-- build:js({.tmp,<%= yeoman.app %>}) scripts/libs.js -->
        <script src="components/jquery/jquery.js"></script>
        <!-- endbuild -->

        <!-- build:js({.tmp,<%= yeoman.app %>}) scripts/vendor/bootstrap.js -->
        <% if (css_preprocessor_use && css_preprocessor == 'compass') { %>
        <script src="components/bootstrap-sass/dist/js/bootstap.js"></script>
        <% } else { %>
        <script src="components/bootstrap/dist/js/bootstrap.js"></script>
        <% } %>
        <!-- endbuild -->

        <!-- build:js({.tmp,<%= yeoman.app %>}) scripts/<%= _.slugify(apptitle) %>.js -->
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
        <!-- endbuild -->

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='//www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X');ga('send','pageview');
        </script>
    </body>
</html>
