function doLoadMenu() {
    $.ajax({
        url: "/items/get_user_menus.json",
        success: function (data) {
            var addHtml = "";
            for (var i = 0; i < data.length; i++) {
                if (data[i][3] == null) {
                    addHtml += '<li>'
                        + '<a href="#userMeun' + i + '" class="nav-header menu-first" data-toggle="collapse" style="color: #999;" name="fmenu">' + data[i][1] + '</a>'
                        + '<ul id="menu' + data[i][0] + '" class="nav nav-sidebar nav-list collapse in menu-second">'
                        + '</ul>'
                        + '</li>'
                }
            }
            $(".nav-sidebar").append(addHtml);
            for (var i = 0; i < data.length; i++) {
                if (data[i][3] != null) {
                    var liHtml = '<li class=""><a href="/' + data[i][2] + '" onclick="addEvent();" class="menu-first">' + data[i][1] + ' <span class="sr-only"></span></a></li>';
                    $("#menu" + data[i][3]).append(liHtml);
                }
            }

            $('#menuul').collapse({
                toggle: true
            });

            $(".sidebar-menu").find("a").unbind("click").click(
                function () {
                    if ($(this).hasClass("nav-header")) {
                        $(this).parent().find("ul").collapse('toggle');
                    } else {
                        $(".sidebar-menu").find("a").parent().removeClass("active");
                        $(this).parent().addClass("active");

                    }
                }
            )
            addMenuClass();
        }
    })
};
function addEvent() {
    $(".sidebar-menu").find("a").bind("click").click(
        function () {
            if ($(this).hasClass("nav-header")) {
                $(this).parent().find("ul").collapse('toggle');
            }
        }
    )
}

function addMenuClass() {
    var url = window.location.pathname;
    url = "/" + url.split("/")[1];
    var a_tags = $("#menuul").find("a");
    for (var i = 0; i < a_tags.length; i++) {
        if ($(a_tags[i]).attr("href") == url) {
            $(a_tags[i]).parent().addClass("active");
        } else {
            $(a_tags[i]).parent().removeClass("active");
        }

    }
}
