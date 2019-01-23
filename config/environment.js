'use strict';

module.exports = function(environment) {
  let ENV = {
    modulePrefix: 'travelonline',
    environment,
    rootURL: '/',
    locationType: 'auto',
    firebase: {
      apiKey: 'xyz',
      authDomain: 'YOUR-FIREBASE-APP.firebaseapp.com',
      databaseURL: 'https://YOUR-FIREBASE-APP.firebaseio.com',
      projectId: "YOUR-FIREBASE-APP-ID",
      storageBucket: 'YOUR-FIREBASE-APP.appspot.com',
      messagingSenderId: "YOUR-MESSAGE-SENDER-ID"
    },
    torii: { sessionServiceName: 'session' },
    contentSecurityPolicy: {
      // 'default-src': "'none'",
      // 'script-src': "'self' 'unsafe-inline' 'unsafe-eval'",
      // 'font-src': "'self'",
      // 'connect-src': "'self'",
      // 'img-src': "'self'",
      // 'report-uri':"'localhost'",
      // 'style-src': "'self' 'unsafe-inline'",
      // 'frame-src': "'none'"
      'script-src': "'self' 'unsafe-eval' apis.google.com",
      'frame-src': "'self' https://*.firebaseapp.com",
      'connect-src': "'self' wss://*.firebaseio.com https://*.googleapis.com"
    },
    EmberENV: {
      FEATURES: { },
      EXTEND_PROTOTYPES: { Date: false }
    },

    APP: { },

    moment: {
      includeTimezone: 'all',
      outputFormat: 'L',
      allowEmpty: false,
      includeLocales: true
      //includeLocales: ['en', 'ru', 'uk']
    }
  };

  if (environment === 'development') {
    ENV.APP.LOG_RESOLVER = false;
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_TRANSITIONS = false;
    ENV.APP.LOG_TRANSITIONS_INTERNAL = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;
  }

  if (environment === 'test') {
    ENV.locationType = 'none';
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;
    ENV.APP.rootElement = '#ember-testing';
    ENV.APP.autoboot = false;
  }

  if (environment === 'production') {
  }

  return ENV;
};
