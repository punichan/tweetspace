window.onload = function(){

  function appendUser(user){
    var html =
    `<li class="user-post">
      <a class="link-section" href="/users/${user.id}"></a>
      <div class="avater-section">
        <div class="avater-section__avater">
          <a href="/users/${user.id}"><img class="avater-section__avater--size" src="${user.avater.url}"></a>
          <a class="avater-section__name" href="/users/${user.id}">${user.name}</a>
        </div>
      </div>
      <div class="profile-section">
        <div class="profile-section__text">
        ${user.profile}
        </div>
      </div>
    </li>`

      $(".users-list").append(html);
    }

    function noContent(){
      var html =
      `<li class="tweet-contener">
        NO Search Result 
      </li>`
      $(".users-list").append(html);
    }

    $("#search").on("keyup",function(){
      var input = $(this).val();
      console.log("user")

      if(input !== ""){
        $.ajax({
          url:      'users',
          type:     'GET',
          data:     {keyword: input},
          dataType: 'json'
        })

        .done(function(userss){
          $(".users-list").empty();
          if(userss.length !==0){
            userss.forEach(function(user){
              appendUser(user)
              console.log(user)
            })
          }
          if(userss.length === 0){
            noContent();
          }
        })
        .fail(function(){
          alert('検索に失敗しました')
        })
      }
    })
  }

