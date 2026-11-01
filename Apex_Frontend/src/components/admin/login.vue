<script>

</script>

<template>
    <div class="wrapper">
        <div class="logo">
            <img src="../images/home-logo.png" alt="" width="100%" height="100%">
        </div>
        <div class="card-container">
            <form action="login">
                <div class="usr">
                    <label for="user">Username</label><br>
                    <input type="text" id="user" name="Username" value="example@apexautos.ie"><br>
                </div>
                <div class="password">
                    <label for="pwd">Password</label><br>
                    <input type="password" id="pwd" name="pwd" value="password">
                </div>
                <div class="remember">
                    <label><input type="checkbox" id="ckbx"> Remember Me</label>
                </div>
                <button type="submit" class="btn">Submit</button>
            </form>
        </div>
    </div>
</template>

<style scoped>

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}
.wrapper{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
   background: repeating-radial-gradient(ellipse, #b81919 0%, #7f2929 32%, #270c0c 62%, #000000 99%);
}

.card-container{
    width: 300px;
    margin-left: 50%;
    margin-right: 50%;
    margin-bottom: 50%;
    padding: 30px;
    font-size: larger;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    background-image: linear-gradient(to bottom, white, grey);
    
    box-shadow: 0 10px 20px 0 #6e4a4a;
}
.card-container input{
    margin: 5%;
    background-color: rgb(245, 245, 245);
    color: black;
    padding-right: 5%;
    border-radius: 10px;
    padding-left: 5px;
}
.card-container button{
    margin-top: 10%;
    border-radius: 10px;
    background: linear-gradient( to bottom, grey, white);
    padding: 10px;
    color: rgb(21, 20, 20);
}
.card-container button:hover{
background: linear-gradient(rgb(253, 250, 250), red, black);
color: rgb(235, 233, 233);
}
#ckbx{
    appearance: none;
    -webkit-appearance: none;
    margin: 0 8px 0 0;
    width: 16px;
    height: 16px;
    background-color: rgb(253, 253, 246);
    border: 1px solid gray;
    border-radius: 2px;
    vertical-align: middle;
    cursor: pointer;
}
#ckbx:checked{
    background-color: rgb(155, 54, 54);
}

.logo{
   width: 400px;
   height: 300px;
   margin-bottom: 5%;
}
</style>