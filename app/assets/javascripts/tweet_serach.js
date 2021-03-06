$(document).on('turbolinks:load', function() {
  function appendTweet(tweet){
    var html =
    `<li class="tweet-post">
      <a class="link-section" href="/tweets/${tweet.id}"></a>
        <div class="user-section">
          <div class="user-section__detail">
            <a href="/users/${tweet.user_id}"><img class="user-section__detail--size" src="${tweet.user_avater.url}"></a>
            <a class="user-section__detail--font" href="/users/${tweet.user_id}">${tweet.user_name}</a>
          </div>
        </div>
        <div class="img-section"></div>
          <img class="img-section__img" src="${tweet.image.url}">
        <div class="detail-section">
          <div class="contents-area">
            <div class="contents-area__date">
              <div class="contents-area__date--font">
                ${tweet.created_at}
              </div>
            </div>
          </div>
          <div class="category-area">
            <div class="category-area__btn">
              <div class="category-area__btn--kind">
                ${tweet.category}
              </div>
              <div class="category-area__btn--place">
                ${tweet.place}
              </div>
            </div>
            <div class="category-area__store">
              <div class="category-area__store--font">
                ${tweet.store}
              </div>
            </div>
          </div>
          <div class="food-area">
            <div class="food-area__name">
              ${tweet.food}
            </div>
            <div class="food-area__price">
              ${tweet.price}
              <span>円</span>
            </div>
          </div>
          <div class="tweet-area">
            ${tweet.tweet}
          </div>
        </div>
    </li>`

    $(".tweets-list").append(html);
  }
  function noContent(){
    var html =
    `<li class="tweet-contener">
      NO Search Result 
    </li>`
    $(".tweets-list").append(html);
  }

  $('#search').on("keyup",function(){
    var input = $(this).val();
    console.log(input)
    
    if(input !== ""){
      $.ajax({
        url:      'tweets',
        type:     'GET',
        data:     {keyword: input},
        dataType: 'json'
      })

      .done(function(tweetss){
        console.log(tweetss)
        $(".tweets-list").empty();
        if(tweetss.length !==0){
          tweetss.forEach(function(tweet){
            appendTweet(tweet);
            console.log(tweet)
          })
        }
        if(tweetss.length === 0){
          noContent();
        }
      })
      .fail(function(){
        alert('検索に失敗しました')
      })
    }
  })
});
