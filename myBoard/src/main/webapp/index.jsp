<DOCTYPE HTML5>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
  </head>

  <body width="100%" height="100%">
    <form action="index.html" method="post" class="loginForm">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" class="pw" placeholder="PW">
      </div>
      <button type="button" class="btn" onclick="userLogIn()">
        LOG IN
      </button>
      <script>
      function userLogIn(){
    			location.href = '/test';
    	}
      </script>
      <div class="bottomText">
        Don't you have ID? <a href="#">sign up</a>
      </div>
    </form>
  </body>
</html>