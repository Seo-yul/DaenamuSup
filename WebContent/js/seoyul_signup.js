            function winclose(){
                self.opener = null;
                self.close();
            }
            /**
             * 가입핸들러
             */
            function handleSignUp() {
                var email = document.getElementById('SignupEmail').value;
                var emailcheck=email.indexOf('@');
                var password = document.getElementById('inputPassword').value;
                var passCheck = document.getElementById('checkPassword').value;
                if(password==passCheck){
                    if ((email.length < 5)||emailcheck==-1) {
                        alert('이메일을 정확히 입력해주세요.');
                        return;
                    }
                    if (password.length < 8) {
                        alert('비밀번호가 너무 짧습니다.');
                        return;
                    }
                }else{
                    alert('비밀번호가 일치하지 않습니다.')
                    return;
                }
                
                //회원가입
                // 계정생성시작
                firebase.auth().createUserWithEmailAndPassword(email, password).catch(function (error) {
                // 에러핸들러
                    var errorCode = error.code;
                    var errorMessage = error.message;
                    if (errorCode == 'auth/weak-password') {
                        alert('8자리 이상 입력해주세요!');
                    } else {
                        //alert(errorMessage);
                        alert('이미 존재하는 이메일 입니다.');
                    }
                    console.log(error);
                });
                // 계정생성 끝
            }
            function initApp() {       
                firebase.auth().onAuthStateChanged(function (user) {
                    if (user) {
                        winclose();
                    }
                });
                document.getElementById('quickstart-sign-up').addEventListener('click', handleSignUp, false);
            }
            window.onload = function () {
                initApp();
            };