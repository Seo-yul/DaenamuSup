function logoutControl() {
    if (firebase.auth().currentUser) {
        firebase.auth().signOut();
    }
}
function loginControl() {
    firebase.auth().onAuthStateChanged(function (user) {
        if (!user) {
            // 유저가 로그아웃한 경우                                     
           location.href = "index.html";
        }
        document.getElementById('quickstart-sign-in').disabled = false;
    });
    document.getElementById('quickstart-sign-in').addEventListener('click', logoutControl, false);
}
window.onload = function () {
    loginControl();
};