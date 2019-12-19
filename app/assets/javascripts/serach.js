window.onload = function(){

  function appendTweet(tweet){
    var html =
    `<li class="tweet-contener">
      <a class="link-btn" href="/tweets/${tweet.id}"></a>
        <div class="avater-contener">
          <a href="/users/${tweet.user_id}"><img alt="" class="avater-size" src="${tweet.user_avater.url}"></a>
        </div>
        <div class="contents-contener">
          <div class="contents-contener__user">
            <a class="user-name" href="/users/${tweet.user_id}">${tweet.user_name}</a>
            <div class="daytime">
              ${tweet.created_at}
            </div>
          </div>
          <div class="contents-contener__text">
            ${tweet.tweet}
          </div>
        <div class="contents-contener__image"></div>
        <div class="contents-contener__contents">
          <div class="contents-contener__contents--likebtn-font">
            <a rel="nofollow" data-method="delete" href="/tweets/${tweet.id}/likes"><i class="far fa-heart"></i>
              ${tweet.likes.length}
            </a>
          </div>
          <div class="contents-contener__contents--comment-font">
            <i class="far fa-comments"></i> 
              ${tweet.comments.length}
          </div>
        </div>
      </div>
    </li>`
    $(".tweets-contener").append(html);
  }

  $("#tweet").on("keyup",function(){
    var input = $(this).val();
    console.log(this)

    $.ajax({
      url:      '/',
      type:     'GET',
      data:     {keyword: input},
      dataType: 'json'
    })

    .done(function(tweetss){
      console.log(tweetss)
      $(".tweets-contener").empty();
      if(tweetss.length !==0){
        tweetss.forEach(function(tweet){
          appendTweet(tweet);
        })
      }
    })
  })
}
