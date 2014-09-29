$('.long-list').each(function () {
    $(this).children(':gt(9)').hide().last().after(
        $('<a />').attr('href', '#').addClass('more-button').text('Show more').click(function () {
            var a = this;
            var list = $(this).parent()
            list.children('li:not(:visible):lt(5)').fadeIn(function () {
                if (list.children('li:not(:visible)').length == 0)
                    $(a).remove();
            });
            return false;
        })
    );
});
