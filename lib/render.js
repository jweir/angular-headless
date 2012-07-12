var jsdom = require('jsdom');

// html is the fully formed html document to render
function render(html, javascript, callback){
  jsdom.env(
    {
    html: html,
    scripts: ['http://code.angularjs.org/angular-1.0.1.js'],
    src: javascript,
    done: function(errors,window){
      window.location.protocol = "http:"
      window.angular.bootstrap(window.angular.element(window.document))
      callback(errors, window);
    }
  }
  )
}

module.exports = render;

