function winclose(){
    self.opener = null;
    self.close();
}
function sendPasswordReset() {
    var email = document.getElementById('findEmail').value;
    firebase.auth().sendPasswordResetEmail(email).then(function () {
    }).catch(function (error) {
      var errorCode = error.code;
      var errorMessage = error.message;
      if (errorCode == 'auth/invalid-email') {
        alert(errorMessage);
      } else if (errorCode == 'auth/user-not-found') {
        alert(errorMessage);
      }
      console.log(error);
    });
    alert('해당 이메일을 확인해주세요!');
    winclose();
  }

function initApp() {       
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) {
            winclose();
        }
    });
    document.getElementById('password-reset').addEventListener('click', sendPasswordReset, false);
}
window.onload = function () {
    initApp();
};