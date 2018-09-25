var express = require('express');
var logger = require('morgan');
var bodyParser = require('body-parser');
var moment = require('moment');
var envConfigs = require('./configs/env');
var jwt = require('jsonwebtoken');
var passport = require('passport');
var LocalStratey = require('passport-local').Strategy;
var JwtStrategy = require('passport-jwt').Strategy;
var ExtractJwt = require('passport-jwt').ExtractJwt;
var passportAuth = require('./passportAuth');
var userDao = require('./dao/userDao');


var JwtStrategy = require('passport-jwt').Strategy;
var ExtractJwt = require('passport-jwt').ExtractJwt;
var opts = {}
opts.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
opts.secretOrKey = 'secret';
opts.issuer = 'accounts.examplesoft.com';
opts.audience = 'yoursite.net';

passport.use(new JwtStrategy(envConfigs.accessTokenOptions, function(jwt_payload, done) {
    userDao.findByUserId(jwt_payload.sub, function(err, user) {
        if (err) {
            return done(err, false);
        }
        if (user) {
            return done(null, user);
        } else {
            return done(null, false);
            // or you could create a new account
        }
    });
}));