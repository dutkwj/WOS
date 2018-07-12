!function () {
    var analytics = window.analytics = window.analytics || [];
    if (!analytics.initialize)if (analytics.invoked)window.console && console.error && console.error("Segment snippet included twice."); else {
        analytics.invoked = !0;
        analytics.methods = ["trackSubmit", "trackClick", "trackLink", "trackForm", "pageview", "identify", "reset", "group", "track", "ready", "alias", "page", "once", "off", "on"];
        analytics.factory = function (t) {
            return function () {
                var e = Array.prototype.slice.call(arguments);
                e.unshift(t);
                analytics.push(e);
                return analytics
            }
        };
        for (var t = 0; t < analytics.methods.length; t++) {
            var e = analytics.methods[t];
            analytics[e] = analytics.factory(e)
        }
        analytics.load = function (t) {
            var e = document.createElement("script");
            e.type = "text/javascript";
            e.async = !0;
            e.src = ("https:" === document.location.protocol ? "https://" : "http://") + "cdn.segment.com/analytics.js/v1/" + t + "/analytics.min.js";
            var n = document.getElementsByTagName("script")[0];
            n.parentNode.insertBefore(e, n)
        };
        analytics.SNIPPET_VERSION = "3.1.0";
        analytics.load("IwfrLOxjdqT3a7k7PusOMhbeWFuB4o89");
        analytics.page('homepage')
    }
}();

/* Slider */

jQuery(document).ready(function ($) {
    $('.slider').unslider({
        autoplay: true,
        speed: 1200,
        delay: 24000,
        infinite: true,
        nav: function (index, label) {
            switch (index) {
                case 0:
                    return 'eCommerce';
                    break;
                case 1:
                    return 'Business';
                    break;
                case 2:
                    return 'Event';
                    break;
                case 3:
                    return 'App';
                    break;
            }
        },
        arrows: false,
        activeClass: 'slideFocus'
    });
});

/* Email Submission scripts */

$(function () {
    $('.signup-focus').click(function (e) {
        e.preventDefault();
        $('.overlay').fadeIn("slow");
        $('.signup-form').addClass("focus");
    });
    $('.overlay').click(function () {
        $('.overlay').fadeOut("slow");
    });
});

$(function () {
    $('#subForm').submit(function (e) {
        e.preventDefault();
        $(".form-feedback").fadeOut("slow");
        $(".overlay").delay(3000).fadeOut("slow");
        $.getJSON(this.action + "?callback=?", $(this).serialize(), function (data) {
            if (data.Status === 400) {
                $(".bg-warning").html(data.Message).fadeIn("slow").delay(2000).fadeOut("slow");
            } else { // 200
                $(".bg-success").html("You're in, we'll email you when we launch!").fadeIn("slow").delay(5000).fadeOut("slow");
            }
        });
    });
});
$(function () {
    $('#subForm2').submit(function (e) {
        e.preventDefault();
        $(".form-feedback").fadeOut("slow");
        $(".overlay").delay(3000).fadeOut("slow");
        $.getJSON(this.action + "?callback=?", $(this).serialize(), function (data) {
            if (data.Status === 400) {
                $(".bg-warning").html(data.Message).fadeIn("slow").delay(2000).fadeOut("slow");
            } else { // 200
                $(".bg-success").html("You're in, we'll email you when we launch!").fadeIn("slow").delay(5000).fadeOut("slow");
            }
        });
    });
});

/* Animations */

$('.preactivated').bind('inview', function () {
    $(this).addClass("activated");
});

// particles

particlesJS('particles-js',

    {
        "particles": {
            "number": {
                "value": 60,
                "density": {
                    "enable": true,
                    "value_area": 800
                }
            },
            "color": {
                "value": "#0090f7"
            },
            "shape": {
                "type": "circle",
                "stroke": {
                    "width": 0,
                    "color": "#0090f7"
                },
                "polygon": {
                    "nb_sides": 5
                },
                "image": {
                    "src": "img/github.svg",
                    "width": 100,
                    "height": 100
                }
            },
            "opacity": {
                "value": 0.5,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 3,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 40,
                    "size_min": 0.1,
                    "sync": false
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#0090f7",
                "opacity": 0.4,
                "width": 1
            },
            "move": {
                "enable": true,
                "speed": 1,
                "direction": "right",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "bounce": false,
                "attract": {
                    "enable": true,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        },
        "interactivity": {
            "detect_on": "canvas",
            "events": {
                "onhover": {
                    "enable": true,
                    "mode": "grab"
                },
                "onclick": {
                    "enable": false,
                    "mode": "push"
                },
                "resize": true
            },
            "modes": {
                "grab": {
                    "distance": 167.83216783216784,
                    "line_linked": {
                        "opacity": 1
                    }
                },
                "bubble": {
                    "distance": 400,
                    "size": 40,
                    "duration": 2,
                    "opacity": 8,
                    "speed": 3
                },
                "repulse": {
                    "distance": 200,
                    "duration": 0.4
                },
                "push": {
                    "particles_nb": 4
                },
                "remove": {
                    "particles_nb": 2
                }
            }
        },
        "retina_detect": true
    }

);