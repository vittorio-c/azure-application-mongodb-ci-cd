console.log('app.js')

$( document ).ready(function() {
   setImageWithoutBlur();
});

function setImageWithoutBlur() {
    let url = $('.movie-image');

    url.each(function() {
        let src = $(this).attr('src');
        let str = src.replace("_filter(blur)", "");
        $(this).attr('src', str);
    });
}

$('.movie-image').on('click', function() {
    console.log('modal');

    let modal = $('#myModal');
    let modalImg = $('#img01');
    let img = $(this);

    modal.css('display', 'block');
    modalImg.attr('src', img.attr('src'));
});

$('.close').on('click', function() {
    let modal = $('#myModal');
    modal.css('display', 'none');
});

