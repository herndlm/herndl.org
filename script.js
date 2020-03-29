if (location.protocol === 'http:') {
    location.replace(`https:${location.href.substring(location.protocol.length)}`);
}

window.onload = function () {
    for (let element of document.getElementsByTagName("a")) {
        if (0 === element.href.indexOf("mailto:") || 0 === element.href.indexOf("xmpp:")) {
            let hrefParts = element.href.split(":");
            let urlWithoutProtocol = hrefParts[1].split("").reverse().join("");
            element.href = hrefParts[0] + ":" + urlWithoutProtocol;
            element.innerHTML = urlWithoutProtocol;
        }
    }
}
