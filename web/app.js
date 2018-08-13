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

var database = firebase.database();
function writeUserData(uid, path, imageUrl) {
       firebase.database().ref('photos/'+uid).set({
        uid: path,
        profile_picture : imageUrl
    });
}
