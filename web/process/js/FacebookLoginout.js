window.fbAsyncInit = function () {
    FB.init({
        appId: '319006470079219',
        cookie: true,                     // Enable cookies to allow the server to access the session.
        xfbml: true,                     // Parse social plugins on this webpage.
        version: 'v12.0'           // Use this Graph API version for this call.
    });

    FB.getLoginStatus(checkLoginStatus);
};

var checkLoginStatus = function (response) {   // Called after the JS SDK has been initialized.

    //statusChangeCallback(response);        // Returns the login status.
    if (response.status == 'connected') {
        accessToken = response.authResponse.accessToken; //get access token
        userId = response.authResponse.userID; //get FB UID
        useremail = response.authResponse.email;
        return true;
    } else {
        console.log("Connections : "+response.status);
        return false;
    }
}

function fnFbCustomLogin(qualifiedName, value) {
    FB.login(function (res) {
        console.log('login =>', res);
        if(res.status == 'connected'){
            FB.api('/me', 'GET', {"fields" : "id, name, email"}, function (res) {

                //create element(form)
                var newForm = document.createElement('form');
                //set attribute(form)
                newForm.name = 'ApiLoginForm';
                newForm.method = 'post';
                newForm.action = '../process/processLoginMember.jsp?api=1';
                newForm.target = '_blank';

                //create element(input)
                var input1 = document.createElement('input');
                var input2 = document.createElement('input');
                var input3 = document.createElement('input');
                var input4 = document.createElement('input');

                var userid = res.id;
                var name = res.name;
                var email = res.email;

                //set attribute(input)
                input1.setAttribute("type", "hidden");
                input1.setAttribute("id", "userid");
                input1.setAttribute("name", "userid");
                input1.setAttribute("value", userid);

                input2.setAttribute("type", "hidden");
                input2.setAttribute("id", "passwd");
                input2.setAttribute("name", "passwd");
                input2.setAttribute("value", userid + "@f");

                input3.setAttribute("type", "hidden");
                input3.setAttribute("id", "name");
                input3.setAttribute("name", "name");
                input3.setAttribute("value",name);

                if(res.email == "undefined"){
                    input4.setAttribute("type", "hidden");
                    input4.setAttribute("id", "email");
                    input4.setAttribute("name", "email");
                    input4.setAttribute("value", "");
                }else{
                    input4.setAttribute("type", "hidden");
                    input4.setAttribute("id", "email");
                    input4.setAttribute("name", "email");
                    input4.setAttribute("value", email);
                }

                //append input (to form)
                newForm.appendChild(input1);
                newForm.appendChild(input2);
                newForm.appendChild(input3);
                newForm.appendChild(input4);

                //append form(to body)
                document.body.appendChild(newForm);

                //submit form
                newForm.submit();
            });
        }else {
            console.log("checkLoginStatus 가 false 입니다.");
        }
    });
}

function rand(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
}