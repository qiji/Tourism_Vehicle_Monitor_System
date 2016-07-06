function GetCookie(c_name) {
    var c_value = document.cookie;
    var c_start = c_value.indexOf(" " + c_name + "=");
    if (c_start == -1) {
        c_start = c_value.indexOf(c_name + "=");
    }
    if (c_start == -1) {
        c_value = null;
    } else {
        c_start = c_value.indexOf("=", c_start) + 1;
        var c_end = c_value.indexOf(";", c_start);
        if (c_end == -1) {
            c_end = c_value.length;
        }
        c_value = decodeURI(c_value.substring(c_start, c_end));
    }
    return c_value;
}

function SetCookie(cookieName, cookieValue) {
    var today = new Date();
    var expire = new Date();
    var nDays = 30;
    expire.setTime(today.getTime() + 3600000 * 24 * nDays);
    document.cookie = cookieName + "=" + encodeURI(cookieValue) + ";expires="
                + expire.toGMTString() + "; path=/";
}