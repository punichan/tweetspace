window.onload = function(){
  $('.tweets-list').infiniteScroll({
    path : 'nav.pagination a[rel=next]',
    append : '.tweet-post',
    history: false,
    prefill: true,
    status: '.page-load-status',
    debug: false,
  });
  console.log("o");
};