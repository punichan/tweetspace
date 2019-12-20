// window.onload = function(){

//   function appendUser(user){
//     var html =
//     `<div class="tweet-contener">
//       <div class="avater-contener">
//         <a href="/users/12"><img alt="" class="avater-size" src="https://s3-ap-northeast-1.amazonaws.com/tweetspacepunityan/uploads/user/avater/12/IMG_1998.JPG"></a>
//           <div class="avater-contener__btn"></div>
//             <a class="follow" rel="nofollow" data-method="post" href="/users/12/relationships">follow</a>
//           </div>
//       <div class="contents-contener">
//         <div class="contents-contener__user">
//           <a class="user-name" href="/users/12">カレー</a>
//         </div>
//         <div class="contents-contener__text">
//         </div>
//       </div>
//     </div>`

//       $(".users-contener").append(html);
//     }

//     function noContent(){
//       var html =
//       `<li class="tweet-contener">
//         NO Search Result 
//       </li>`
//       $(".users-contener").append(html);
//     }

//     $("#name").on("keyup",function(){
//       var input = $(this).val();
//       console.log("user")

//       if(input !== ""){
//         $.ajax({
//           url:      '/',
//           type:     'GET',
//           data:     {keyword: input},
//           dataType: 'json'
//         })

//         .done(function(userss){
//           $(".users-contener").empty();
//           if(userss.length !==0){
//             userss.forEach(function(user){
//               appendUser(user)
//               console.log(user)
//             })
//           }
//           if(userss.length === 0){
//             noContent();
//           }
//         })
//         .fail(function(){
//           alert('検索に失敗しました')
//         })
//       }
//     })
//   }

