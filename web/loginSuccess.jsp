<%--
  Created by IntelliJ IDEA.
  User: User1
  Date: 12/8/2018
  Time: 11:44
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
    <script type="text/javascript">
        initApp = function() {
            firebase.auth().onAuthStateChanged(function(user) {
                if (user) {
                    // User is signed in.
                    var displayName = user.displayName;
                    var email = user.email;
                    var emailVerified = user.emailVerified;
                    var photoURL = user.photoURL;
                    var uid = user.uid;
                    var phoneNumber = user.phoneNumber;
                    var providerData = user.providerData;
                    user.getIdToken().then(function(accessToken) {
                        document.getElementById('sign-in-status').textContent = 'Signed in';
                        document.getElementById('sign-in').textContent = 'Sign out';
                        document.getElementById('displayName').value = displayName;
                        document.getElementById('account-details').textContent = JSON.stringify({
                            displayName: displayName,
                            email: email,
                            emailVerified: emailVerified,
                            phoneNumber: phoneNumber,
                            photoURL: photoURL,
                            uid: uid,
                            accessToken: accessToken,
                            providerData: providerData
                        }, null, '  ');
                    });
                } else {
                    // User is signed out.
                    document.getElementById('sign-in-status').textContent = 'Signed out';
                    document.getElementById('sign-in').textContent = 'Sign in';
                    document.getElementById('account-details').textContent = 'null';
                }
            }, function(error) {
                console.log(error);
            });
        };


        window.addEventListener('load', function() {
            initApp()
        });
    </script>
</head>
<body>
<h1>Welcome to My Awesome App</h1>
<div id="sign-in-status"></div>
<div id="sign-in"></div>
<input type="hidden" id="displayName">
<div id="account-details"></div>
<div class="mainDiv" align="left">
    <h1 align="left">Firebase File Upload</h1>
    <progress id="uploader" value="0" max="100">0%</progress>
    <input type="file" id="fileButton" value="upload"/>
</div>
<script>
    var uploader = document.getElementById('uploader');
    var fileButton = document.getElementById('fileButton');
    fileButton.addEventListener('change', function(e){
        var file = e.target.files[0];
        var storageRef = firebase.storage().ref('img/'+displayName+"/"+file.name);
        var task = storageRef.put(file);
        task.on('state_changed', function progress(snapshot) {
            var percentage = (snapshot.bytesTransferred/snapshot.totalBytes)*100;
            uploader.value = percentage;

        }, function error(err) {


        },function () {
            //alert('Uploaded');
            task.snapshot.ref.getDownloadURL().then(function(downloadURL) {
                console.log('File available at', downloadURL);
            });
        });
    });
</script>
</body>
</html>