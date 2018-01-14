// ==UserScript==
// @name         wuglove orig img
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  try to take over the world!
// @author       You
// @include     https://finn-neo-admin.info/newsimage/*pc_thumb.jpg
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    window.location.href = window.location.href.replace("_pc_thumb", "");
})();
