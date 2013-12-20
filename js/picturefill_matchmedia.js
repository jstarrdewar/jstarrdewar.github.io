/*! matchMedia() polyfill - Test a CSS media type/query in JS. Authors & copyright (c) 2012: Scott Jehl, Paul Irish, Nicholas Zakas. Dual MIT/BSD license */
window.matchMedia=window.matchMedia||(function(e,f){var c,a=e.documentElement,b=a.firstElementChild||a.firstChild,d=e.createElement("body"),g=e.createElement("div");g.id="mq-test-1";g.style.cssText="position:absolute;top:-100em";d.appendChild(g);return function(h){g.innerHTML='&shy;<style media="'+h+'"> #mq-test-1 { width: 42px; }</style>';a.insertBefore(d,b);c=g.offsetWidth==42;a.removeChild(d);return{matches:c,media:h}}})(document);

/*! Picturefill - Responsive Images that work today. (and mimic the proposed Picture element with span elements). Author: Scott Jehl, Filament Group, 2012 | License: MIT/GPLv2 */
(function(w){"use strict";w.picturefill=function(){var ps=w.document.getElementsByTagName("span");for(var i=0,il=ps.length;i<il;i++){if(ps[i].getAttribute("data-picture")!==null){var sources=ps[i].getElementsByTagName("span"),matches=[];for(var j=0,jl=sources.length;j<jl;j++){var media=sources[j].getAttribute("data-media");if(!media||(w.matchMedia&&w.matchMedia(media).matches)){matches.push(sources[j])}}var picImg=ps[i].getElementsByTagName("img")[0];if(matches.length){var matchedEl=matches.pop();if(!picImg||picImg.parentNode.nodeName==="NOSCRIPT"){picImg=w.document.createElement("img");picImg.alt=ps[i].getAttribute("data-alt")}picImg.src=matchedEl.getAttribute("data-src");matchedEl.appendChild(picImg)}else if(picImg){picImg.parentNode.removeChild(picImg)}}}};if(w.addEventListener){w.addEventListener("resize",w.picturefill,false);w.addEventListener("DOMContentLoaded",function(){w.picturefill();w.removeEventListener("load",w.picturefill,false)},false);w.addEventListener("load",w.picturefill,false)}else if(w.attachEvent){w.attachEvent("onload",w.picturefill)}}(this));