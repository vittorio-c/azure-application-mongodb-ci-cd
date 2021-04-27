console.log('app.js')

$( document ).ready(function() {
   setImage() 
});

function setImage() {
    let url = $('.movie-image');

    url.each(function() {
        let src = $(this).attr('src');
        let str = src.replace("_filter(blur)", "");
        $(this).attr('src', str);
    });
}