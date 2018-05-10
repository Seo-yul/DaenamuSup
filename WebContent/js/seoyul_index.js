/**
 * 회원가입 팝업 호출
 */
function showSingup() {
    window.open("signup.html", "회원가입", "width=400, height=520, left=400, top=0");
}
function showFindpw() {
    window.open("reset_passwd.html", "비밀번호 초기화", "width=374, height=371, left=400, top=0");

}
function winclose() {
    self.opener = null;
    self.close();
}

/**
 * 로그인핸들러
 */
function toggleSignIn() {
    if (firebase.auth().currentUser) {
        // [START signout]
        firebase.auth().signOut();
        // [END signout]
    } else {
        var email = document.getElementById('inputEmail').value;
        var password = document.getElementById('inputPassword').value;
        if (email.length < 1) return;
        if (password.length < 1) return;

        // 로그인
        // [START authwithemail]
        firebase.auth().signInWithEmailAndPassword(email, password).catch(function (error) {
            // 에러핸들러
            var errorCode = error.code;
            var errorMessage = error.message;
            // [START_EXCLUDE]
            if (errorCode === 'auth/wrong-password') {

                alert('비밀번호가 틀렸습니다.');
                //alert(errorMessage);
            } else {

                alert('존재하지 않거나 올바른 이메일이 아닙니다.');
                //alert(errorMessage);
            }
            console.log(error);
            document.getElementById('quickstart-sign-in').disabled = false;
            // [END_EXCLUDE]
        });
        // [END authwithemail]
    }
    document.getElementById('quickstart-sign-in').disabled = true;
}
/**
 * 가입핸들러
 */

function handleSignUps() {

    var email = document.getElementById('SignupEmail').value;
    var password = document.getElementById('inputPassword').value;
    var passCheck = document.getElementById('checkPassword').value;
    var flagError = 99;
    alert(email);
    alert(password);
    alert(flagError);

    if (email.length < 1) {
        alert('이메일을 정확히 입력해주세요.');
        return;
    }
    if (password.length < 8) {
        alert('비밀번호가 너무 짧습니다.');
        return;
    }
    //회원가입
    // [START 계정생성시작]
    firebase.auth().createUserWithEmailAndPassword(email, password).catch(function (error) {
        // 에러핸들러
        flagError = 0;
        var errorCode = error.code;
        var errorMessage = error.message;
        // [START_EXCLUDE]
        if (errorCode == 'auth/weak-password') {
            alert('8자리 이상 입력해주세요!');
        } else {
            alert(errorMessage);
        }
        console.log(error);
        // [END_EXCLUDE]
    });
    // [계정생성 끝]
}
/**
 * 확인메일 전송
 */
function sendEmailVerification() {
    // [START sendemailverification]
    firebase.auth().currentUser.sendEmailVerification().then(function () {
        // 이멜확인
        // [START_EXCLUDE]
        alert('계정 확인 이메일을 발송하였습니다.');
        // [END_EXCLUDE]
    });
    // [END sendemailverification]
}
function sendPasswordReset() {
    //var email = document.getElementById('email').value;
    var email = user.emailVerified;
    // [START sendpasswordemail]
    firebase.auth().sendPasswordResetEmail(email).then(function () {
        //패스워드이멜
        // [START_EXCLUDE]
        alert('비밀번호 재설정 이메일을 발송했습니다.');
        // [END_EXCLUDE]
    }).catch(function (error) {
        // 에러핸들러
        var errorCode = error.code;
        var errorMessage = error.message;
        // [START_EXCLUDE]
        if (errorCode == 'auth/invalid-email') {
            alert(errorMessage);
        } else if (errorCode == 'auth/user-not-found') {
            alert(errorMessage);
        }
        console.log(error);
        // [END_EXCLUDE]
    });
    // [END sendpasswordemail];
}

function initApp() {
    // Listening for auth state changes.
    // [START authstatelistener]
    firebase.auth().onAuthStateChanged(function (user) {
        // [START_EXCLUDE silent]
    	document.getElementById('quickstart-verify-email').disabled = true;
        // [END_EXCLUDE]
        if (user) {
            // 유저가 로그인한 경우
            var displayName = user.displayName;
            var email = user.email;
            var emailVerified = user.emailVerified;
            var photoURL = user.photoURL;
            var isAnonymous = user.isAnonymous;
            var uid = user.uid;
            var providerData = user.providerData;

            // [START_EXCLUDE]
            document.getElementById('quickstart-sign-in-status').textContent = '로그인';
            document.getElementById('quickstart-sign-in').textContent = '나가기';
            document.getElementById('quickstart-account-details').textContent = JSON.stringify(user, null, '  ');

            if (!emailVerified) {
                document.getElementById('quickstart-verify-email').disabled = false;
                sendEmailVerification();
            	firebase.auth().signOut();
            }else{
            	location.href = "main.jsp";
            }
            // [END_EXCLUDE]
        } else {
            // 유저가 로그아웃한 경우
            // [START_EXCLUDE]
            document.getElementById('quickstart-sign-in-status').textContent = '나가기';
            document.getElementById('quickstart-sign-in').textContent = '로그인';
            document.getElementById('quickstart-account-details').textContent = 'null';
            // [END_EXCLUDE]
        }
        // [START_EXCLUDE silent]
        document.getElementById('quickstart-sign-in').disabled = false;
        // [END_EXCLUDE]
    });
    // [END authstatelistener]
    document.getElementById('quickstart-sign-in').addEventListener('click', toggleSignIn, false);
    document.getElementById('quickstart-sign-up').addEventListener('click', handleSignUp, false);
    document.getElementById('quickstart-verify-email').addEventListener('click', sendEmailVerification, false);
    document.getElementById('quickstart-password-reset').addEventListener('click', sendPasswordReset, false);
}
window.onload = function () {
    initApp();
};
