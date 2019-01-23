import EmberRouter from '@ember/routing/router';
import config from './config/environment';

const Router = EmberRouter.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('index', { path: '/' });
  this.route('forms');
  this.route('demo', { path: 'components' }, function() {
    this.route('input');
    this.route('select');
    this.route('autocomplete');
  });

});

export default Router;
