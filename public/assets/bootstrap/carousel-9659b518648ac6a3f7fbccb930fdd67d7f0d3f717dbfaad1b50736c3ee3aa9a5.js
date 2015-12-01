/* ========================================================================
 * Bootstrap: carousel.js v3.2.0
 * http://getbootstrap.com/javascript/#carousel
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
+function(e){"use strict";function t(t){return this.each(function(){var r=e(this),i=r.data("bs.carousel"),o=e.extend({},n.DEFAULTS,r.data(),"object"==typeof t&&t),a="string"==typeof t?t:o.slide;i||r.data("bs.carousel",i=new n(this,o)),"number"==typeof t?i.to(t):a?i[a]():o.interval&&i.pause().cycle()})}var n=function(t,n){this.$element=e(t).on("keydown.bs.carousel",e.proxy(this.keydown,this)),this.$indicators=this.$element.find(".carousel-indicators"),this.options=n,this.paused=this.sliding=this.interval=this.$active=this.$items=null,"hover"==this.options.pause&&this.$element.on("mouseenter.bs.carousel",e.proxy(this.pause,this)).on("mouseleave.bs.carousel",e.proxy(this.cycle,this))};n.VERSION="3.2.0",n.DEFAULTS={interval:5e3,pause:"hover",wrap:!0},n.prototype.keydown=function(e){switch(e.which){case 37:this.prev();break;case 39:this.next();break;default:return}e.preventDefault()},n.prototype.cycle=function(t){return t||(this.paused=!1),this.interval&&clearInterval(this.interval),this.options.interval&&!this.paused&&(this.interval=setInterval(e.proxy(this.next,this),this.options.interval)),this},n.prototype.getItemIndex=function(e){return this.$items=e.parent().children(".item"),this.$items.index(e||this.$active)},n.prototype.to=function(t){var n=this,r=this.getItemIndex(this.$active=this.$element.find(".item.active"));return t>this.$items.length-1||0>t?void 0:this.sliding?this.$element.one("slid.bs.carousel",function(){n.to(t)}):r==t?this.pause().cycle():this.slide(t>r?"next":"prev",e(this.$items[t]))},n.prototype.pause=function(t){return t||(this.paused=!0),this.$element.find(".next, .prev").length&&e.support.transition&&(this.$element.trigger(e.support.transition.end),this.cycle(!0)),this.interval=clearInterval(this.interval),this},n.prototype.next=function(){return this.sliding?void 0:this.slide("next")},n.prototype.prev=function(){return this.sliding?void 0:this.slide("prev")},n.prototype.slide=function(t,n){var r=this.$element.find(".item.active"),i=n||r[t](),o=this.interval,a="next"==t?"left":"right",s="next"==t?"first":"last",u=this;if(!i.length){if(!this.options.wrap)return;i=this.$element.find(".item")[s]()}if(i.hasClass("active"))return this.sliding=!1;var l=i[0],c=e.Event("slide.bs.carousel",{relatedTarget:l,direction:a});if(this.$element.trigger(c),!c.isDefaultPrevented()){if(this.sliding=!0,o&&this.pause(),this.$indicators.length){this.$indicators.find(".active").removeClass("active");var p=e(this.$indicators.children()[this.getItemIndex(i)]);p&&p.addClass("active")}var f=e.Event("slid.bs.carousel",{relatedTarget:l,direction:a});return e.support.transition&&this.$element.hasClass("slide")?(i.addClass(t),i[0].offsetWidth,r.addClass(a),i.addClass(a),r.one("bsTransitionEnd",function(){i.removeClass([t,a].join(" ")).addClass("active"),r.removeClass(["active",a].join(" ")),u.sliding=!1,setTimeout(function(){u.$element.trigger(f)},0)}).emulateTransitionEnd(1e3*r.css("transition-duration").slice(0,-1))):(r.removeClass("active"),i.addClass("active"),this.sliding=!1,this.$element.trigger(f)),o&&this.cycle(),this}};var r=e.fn.carousel;e.fn.carousel=t,e.fn.carousel.Constructor=n,e.fn.carousel.noConflict=function(){return e.fn.carousel=r,this},e(document).on("click.bs.carousel.data-api","[data-slide], [data-slide-to]",function(n){var r,i=e(this),o=e(i.attr("data-target")||(r=i.attr("href"))&&r.replace(/.*(?=#[^\s]+$)/,""));if(o.hasClass("carousel")){var a=e.extend({},o.data(),i.data()),s=i.attr("data-slide-to");s&&(a.interval=!1),t.call(o,a),s&&o.data("bs.carousel").to(s),n.preventDefault()}}),e(window).on("load",function(){e('[data-ride="carousel"]').each(function(){var n=e(this);t.call(n,n.data())})})}(jQuery);