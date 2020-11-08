﻿var Ajax = {
    SendRequest: (url, type, data = null, success, error) => {
        var ajaxOptions = {
            type: type,
            url: url,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (success)
                    success(response);
            },
            error: function (response) {
                if (error)
                    error(response);
            }
        };
        if (data)
            ajaxOptions.data = data;
        $.ajax(ajaxOptions);
    },
    Type: {
        Get: "GET",
        Post: "POST",
        Delete: "DELETE",
        Put: "PUT"
    }
}