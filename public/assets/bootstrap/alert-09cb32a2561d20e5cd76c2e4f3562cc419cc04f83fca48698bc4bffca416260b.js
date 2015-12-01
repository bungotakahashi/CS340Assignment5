/* ========================================================================
 * Bootstrap: alert.js v3.2.0
 * http://getbootstrap.com/javascript/#alerts
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
+function(e){"use strict";function t(t){return this.each(function(){var n=e(this),i=n.data("bs.alert");i||n.data("bs.alert",i=new r(this)),"string"==typeof t&&i[t].call(n)})}var n='[data-dismiss="alert"]',r=function(t){e(t).on("click",n,this.close)};r.VERSION="3.2.0",r.prototype.close=function(t){function n(){o.detach().trigger("closed.bs.alert").remove()}var r=e(this),i=r.attr("data-target");i||(i=r.attr("href"),i=i&&i.replace(/.*(?=#[^\s]*$)/,""));var o=e(i);t&&t.preventDefault(),o.length||(o=r.hasClass("alert")?r:r.parent()),o.trigger(t=e.Event("close.bs.alert")),t.isDefaultPrevented()||(o.removeClass("in"),e.support.transition&&o.hasClass("fade")?o.one("bsTransitionEnd",n).emulateTransitionEnd(150):n())};var i=e.fn.alert;e.fn.alert=t,e.fn.alert.Constructor=r,e.fn.alert.noConflict=function(){return e.fn.alert=i,this},e(document).on("click.bs.alert.data-api",n,r.prototype.close)}(jQuery);