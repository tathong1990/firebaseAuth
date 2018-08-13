<%--
  Created by IntelliJ IDEA.
  User: User1
  Date: 12/8/2018
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sample FirebaseUI App</title>
  <script src="https://www.gstatic.com/firebasejs/5.3.1/firebase.js"></script>
  <script>
      // Initialize Firebase
      var config = {
          apiKey: "AIzaSyA3H8URioq12gNBJUgmdtpqMPDUmXiyynQ",
          authDomain: "jasonn-ec58a.firebaseapp.com",
          databaseURL: "https://jasonn-ec58a.firebaseio.com",
          projectId: "jasonn-ec58a",
          storageBucket: "jasonn-ec58a.appspot.com",
          messagingSenderId: "854282856736"
      };
      firebase.initializeApp(config);
  </script>
  <script src="https://cdn.firebase.com/libs/firebaseui/3.2.0/firebaseui.js"></script>
  <link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.2.0/firebaseui.css" />
  <script type="text/javascript">
      // FirebaseUI config.
      var uiConfig = {
          signInSuccessUrl: 'loginSuccess.jsp',
          signInOptions: [
              // Leave the lines as is for the providers you want to offer your users.
              firebase.auth.GoogleAuthProvider.PROVIDER_ID
              //firebase.auth.FacebookAuthProvider.PROVIDER_ID,
             // firebase.auth.TwitterAuthProvider.PROVIDER_ID,
              //firebase.auth.GithubAuthProvider.PROVIDER_ID,
              //firebase.auth.EmailAuthProvider.PROVIDER_ID,
             // firebase.auth.PhoneAuthProvider.PROVIDER_ID,
              //firebaseui.auth.AnonymousAuthProvider.PROVIDER_ID
          ],
          // Terms of service url.
          tosUrl: 'loginSuccess.jsp',
          // Privacy policy url.
          privacyPolicyUrl: 'loginSuccess.jsp'
      };

      // Initialize the FirebaseUI Widget using Firebase.
      var ui = new firebaseui.auth.AuthUI(firebase.auth());
      // The start method will wait until the DOM is loaded.
      ui.start('#firebaseui-auth-container', uiConfig);
  </script>
</head>
<body>
<!-- The surrounding HTML is left untouched by FirebaseUI.
     Your app may use that space for branding, controls and other customizations.-->
<h1>Welcome to My Awesome App</h1>
<div id="firebaseui-auth-container"></div>
</body>
</html>