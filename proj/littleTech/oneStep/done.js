//Every time an Ajax call is being invoked the listener will recognize it and  will call the native app with the request details

var open = XMLHttpRequest.prototype.open;
XMLHttpRequest.prototype.open = function() {
    this.addEventListener("load", function() {
        window.document.querySelector("#root > div > div.top > div.zc-tab-item.active").innerHTML = "Done";
    });
    open.apply(this, arguments);
};
