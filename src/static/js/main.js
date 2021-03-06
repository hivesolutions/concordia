// Hive Concordia System
// Copyright (c) 2008-2020 Hive Solutions Lda.
//
// This file is part of Hive Concordia System.
//
// Hive Concordia System is free software: you can redistribute it and/or modify
// it under the terms of the Apache License as published by the Apache
// Foundation, either version 2.0 of the License, or (at your option) any
// later version.
//
// Hive Concordia System is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// Apache License for more details.
//
// You should have received a copy of the Apache License along with
// Hive Concordia System. If not, see <http://www.apache.org/licenses/>.

// __author__    = João Magalhães <joamag@hive.pt>
// __version__   = 1.0.0
// __revision__  = $LastChangedRevision$
// __date__      = $LastChangedDate$
// __copyright__ = Copyright (c) 2008-2020 Hive Solutions Lda.
// __license__   = Apache License, Version 2.0

(function(jQuery) {
    jQuery.fn.uapply = function(options) {
        // sets the jquery matched object
        var matchedObject = this;

        // retrieves all the currently available items
        var items = jQuery(".timetable .item", matchedObject);

        items.mouseover(function() {
            var element = jQuery(this);
            items.removeClass("hover");
            element.addClass("hover");

            setTimeout(function() {
                var hasMouse = element.hasClass("hover");
                if (!hasMouse) {
                    return;
                }
                element.addClass("top");
            }, 1000);
        });

        items.mouseout(function() {
            var element = jQuery(this);
            element.removeClass("hover");
            setTimeout(function() {
                element.removeClass("top");
            }, 300);
        });
    };
})(jQuery);

jQuery(document).ready(function() {
    var _body = jQuery("body");
    _body.bind("applied", function(event, base) {
        base.uapply();
    });
});
