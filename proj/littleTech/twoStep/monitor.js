//Every time an Ajax call is being invoked the listener will recognize it and  will call the native app with the request details

var open = XMLHttpRequest.prototype.open;
XMLHttpRequest.prototype.open = function() {
    this.addEventListener("load", function() {
        var message = {"status" : this.status, "responseURL" : this.responseURL}
        webkit.messageHandlers.callbackHandler.postMessage(message);
    });
    open.apply(this, arguments);
};
