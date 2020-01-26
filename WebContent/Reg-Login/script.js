function regform(){
    document.title = "Sign up";
    document.querySelector(".dx").style.display = "none";
    document.querySelector(".register").style.display = "flex";
}

function authform(){
    document.title = "Log in";
    document.querySelector(".dx").style.display = "flex";
    document.querySelector(".register").style.display = "none";
    document.querySelector(".rec_pass").style.display = "none";
}

function recoveryform(){
    document.title = "Password recovery";
    document.querySelector(".dx").style.display = "none";
    document.querySelector(".rec_pass").style.display = "flex";
}