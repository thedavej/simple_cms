$(document).ready(function () {
        $('ul.nav > li.dropdown > ul.dropdown-menu > li').click(function (e) {
            e.preventDefault();
            $('ul.dropdown-menu > li').removeClass('active');
            $(this).addClass('active');                
        });            
    });
