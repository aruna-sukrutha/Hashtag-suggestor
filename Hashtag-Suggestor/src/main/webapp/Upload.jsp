<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>


<html>
    <head>
   <!--  <meta name="viewport" content="width=device-width, initial-scale=1" />  -->
    
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=G-5HNZSEY6VK"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());

            gtag('config', 'G-5HNZSEY6VK');
        </script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

        <title>HashTag Suggester</title>
<style>
/* @media screen and (max-width: 481px){ */

    .hovereffect {
        width: auto;
        height: 100%;
        float: left;
        overflow: hidden;
        position: relative;
        text-align: center;
        cursor: default;
        margin: 0 20 0 20;
    }

    .hovereffect .overlay {

        height: 100%;
        position: absolute;
        overflow: hidden;
        top: 0;
        left: 0;
    }

    .hovereffect img {
        display: block;
        position: relative;
        -webkit-transition: all 0.4s ease-in;
        transition: all 0.4s ease-in;
    }

    .hovereffect:hover img {
        /* filter: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg"><filter id="filter"><feColorMatrix type="matrix" color-interpolation-filters="sRGB" values="0.2126 0.7152 0.0722 0 0 0.2126 0.7152 0.0722 0 0 0.2126 0.7152 0.0722 0 0 0 0 0 1 0" /><feGaussianBlur stdDeviation="3" /></filter></svg>#filter');
        filter: grayscale(1) blur(3px);
        -webkit-filter: grayscale(1) blur(3px); */
        -webkit-transform: scale(1.2);
        -ms-transform: scale(1.2);
        transform: scale(1.2);
    }

    .hovereffect h2 {
        text-transform: uppercase;
        text-align: center;
        position: relative;
        font-size: 17px;
        padding: 10px;
       /*  background: rgba(0, 0, 0, 0.6); */
    }

    .hovereffect a.info {
        display: inline-block;
        text-decoration: none;
        padding: 7px 14px;
       /*  border: 1px solid #fff; */
        margin: 50px 0 0 0;
        /* background: rgba(0, 0, 0, 0.6);
        background-color: transparent; */
    }

    .hovereffect a.info:hover {
       /*  box-shadow: 0 0 5px #fff; */
    }

    .hovereffect a.info, .hovereffect h2 {
        /* -webkit-transform: scale(0.7);
        -ms-transform: scale(0.7);
        transform: scale(0.7);
        -webkit-transition: all 0.4s ease-in;
        transition: all 0.4s ease-in; 
        opacity: 0;
        border-color: darkcyan; 
        filter: alpha(opacity=0);*/
        color: white;
        font-weight: bold;
       
    }

    .hovereffect:hover a.info, .hovereffect:hover h2 {
        opacity: 1;
        filter: alpha(opacity=100);
        -webkit-transform: scale(1);
        -ms-transform: scale(1);
        transform: scale(1);
    }
	
	
	
    body {
      /*   background: linear-gradient(to bottom, #ff99cc 0%, #66ccff 100%); */
       background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRsQXq_B2dOYZ3jwtesD6jX_07MOvCUJE6LA&usqp=CAU');
        color: black;
        display: flex;
        flex-direction: column;
       /*  padding: 20px; */
        position: relative;
        /* text-align:center; */
    }

    .wrapper  {
        padding: 25px;
        border-radius: 5px;
        width: auto;
        max-width: 100%;
        margin: 50px auto;
        align-self: center;
        box-sizing: border-box;
        text-align: center;
          background: #FFC0CB ; 
       /*  background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRsQXq_B2dOYZ3jwtesD6jX_07MOvCUJE6LA&usqp=CAU');
         */
    }

    header {
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 20px;
        display: flex;
    }
    h2,h4 {
        /* flex: 1;
        padding: 0;
        margin: 0;
        font-size: 16px;
        letter-spacing: 1px;
        font-weight: 700; */
       /*  color: black; */
       color:black;
        font-family: Comic Sans MS;'
    }
    header span {
        flex: 1;
        text-align: right;
        font-size: 12px;
        color: black;
    }
    .ways ul {
        display: flex;
        list-style: none;
        padding: 0;
        border-radius: 5px;
        overflow: hidden;
       
    }
    
    .ways li {
     background: linear-gradient(to bottom, #FFC0CB 0%, #F0F8FF 100%);
        align-self: center;
        flex: 1;
       
        text-align: center;
        cursor: pointer;
        padding: 15px 0;
        color: #2F4F4F;
        text-transform: uppercase;
        font-weight: 500;
        font-size: 12px;
        letter-spacing: 1px;
        border: 1px solid #ddd;
    }

    .ways li:first-child {
        border-right: 0;
    }
    .ways li:last-child {
        border-left: 0;
    }
    .ways li.active {
        border: 2px solid #1AA1E5;
        color: #66676C;
    }
    .ways li.active::before {
        content: '\f00c';
        font-family: 'fontawesome';
        color: #1AA1E5;
    }
    .ways li:not(.active) {
        padding: 16px 0;
    }
    
    section {
        display: none;
    }
    section.active {
        display: block;
    }
    section input,
    section textarea {
        display: block;
        width: 100%;
        box-sizing: border-box;
        border: 1px solid #ddd;
        outline: 0;
        background-color: #F5F7FA;
        padding: 10px;
        margin-bottom: 10px;
        letter-spacing: 1.4px;
    }
    section textarea {
        min-height: 200px;
    }
    section select {
        display: none;
    }



    .images {
        display: flex;
        flex-wrap:  wrap;
        margin-top: 20px;
    }


    .images .img:hover span {
        display: block;
        color: #fff;
    }

    @media screen and (max-width: 400px) {
        .wrapper {
            margin-top: 0;
        }
        header {
            flex-direction: column;
        }
        header span {
            text-align: left;
            margin-top: 10px;
        }
        .ways li,
        section input,
        section textarea,
        .select-option .head,
        .select-option .option div {
            font-size: 8px;
        }
        .images .img,
        .images .pic {
            flex-basis: 100%;
            margin-right: 0;
        }
    }

    .wrapper footer ul {
        margin: 0;
        margin-top: 30px;
        display: flex;
        list-style: none;
        padding: 0;
    }
    .wrapper footer ul li {
        flex: 1;
    }
    .wrapper footer li span {
        text-transform: capitalize;
        cursor: pointer;
    }
    .wrapper footer li:first-child {
        color: #999;
        text-align: left;
        font-size: 12px;
    }
    .wrapper footer li:first-child span {
        display: inline-block;
        border-bottom: 1px solid #ddd;
    }
    .wrapper footer li:last-child {
        text-align: right;
    }
    .wrapper footer li:last-child span {
        background-color: #22A4E6;
        padding: 10px 20px;
        color: #fff;
        border-radius: 3px;
    }
    @keyframes fadeIn {
        0% { opacity: 0; }
        100% { opacity: 1; }
    }
    
    * {
  box-sizing: border-box;
}

.column {
  float: left;
  width: 33.33%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}
 /*  }  */ 
</style>

        <style>
            #post{
                display:none;
            }
        </style>
        <meta charset="UTF-8">
    </head>
    
   <body>
   <left><a href="https://hashtag-generate.appspot.com/"><img src="http://lh3.googleusercontent.com/hvMFwzL4Ayx7RPoSqSowlOFAO_d_Z3Rsu_DMuMmWP9UHbffOBqI3b3ShjYGRrv8QAHkEiljmdYCwtucz9v3V4i6dcE1OUbJJWdPUd2RZk40" height="120px" width="200px"></a></left>
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v9.0&appId=288101902807985&autoLogAppEvents=1" nonce="O67w0iEg"></script>
    <h4 id="welcome"> 
    </h4> 
    <form action="/hashtag" id="imageform" method="post" enctype="multipart/form-data">
    </form>
    <div id="imageDiv"> </div>
        <script type="text/javascript">
            (function ($) {
                $(document).ready(function () {
                    choose();
                    function choose() {
                        var li = $(".ways li");
                        var section = $(".sections section");
                        var index = 0;
                        li.on("click", function () {
                            index = $(this).index();
                            $(this).addClass("active");
                            $(this).siblings().removeClass("active");

                            section.siblings().removeClass("active");
                            section.eq(index).addClass("active");
                            if (!way) {
                                way = 1;
                            } else {
                                way = 0;
                            }
                        });
                    }


                });
            })(jQuery);

            function imgOnclick(src,id) {
                var hiddenInput = '<input type="hidden" name="hiddenField" value="' + src +'"/>';
                var hiddenInput2 = '<input type="hidden" name="Fb_image_id" value="' + id +'"/>';
                document.getElementById('imageform').innerHTML += hiddenInput;
                document.getElementById('imageform').innerHTML += hiddenInput2;
                document.getElementById('imageform').submit();
            }
        </script>

    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v8.0&appId=288101902807985&autoLogAppEvents=1" nonce="iGO5Dyev"></script>
    <script>
        // This is called with the results from from FB.getLoginStatus().
        var accessToken;
        function statusChangeCallback(response)
        {
            console.log('statusChangeCallback');
            console.log(response);

            if (response.status === 'connected'){
                // Logged into your app and Facebook
                //document.getElementById('post').style.display="block";
                testAPI();
                pullimages(); // images retrieved function 
            }

            else {
                // The person is not logged into your app or we are unable to tell.
                document.getElementById('status').innerHTML = 'Please log ' +
                    'into this app.';
                document.getElementById('post').style.display="none";
            }
        }

        // This function is called when someone finishes with the Login
        // Button.  See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState()
        {
            FB.getLoginStatus(function(response) {
                statusChangeCallback(response);
            });
        }

        window.fbAsyncInit = function() {
            FB.init({
                appId      : '288101902807985',
                xfbml      : true,
                version    : 'v10.0'
            });
            FB.AppEvents.logPageView();
        };

        (function(d, s, id){
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {return;}
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));



        // Here we run a very simple test of the Graph API after login is
        // successful.  See statusChangeCallback() for when this call is made.
        function testAPI()
        {
            console.log('Welcome!  Fetching your information.... ');
            FB.api('/me', function (response) {
                document.getElementById('welcome').innerHTML = '<h4>Welcome, ' + response.name + '!<br> Here is your facebook photos</h4> ';
                document.getElementById('imageform').innerHTML = '<input type="hidden" name="username" value="' + response.name +'"/>';
            });

        }


        function pullimages() 
        {
            //const index = fbAlbumsPhotosObj.data.findIndex(album => album.id == albumId); //Get index of album

            FB.api(
                '/me/albums',
                'GET',
                {"fields":"photos{images}"},
                function(response) 
                {
                    console.log(response);
                    var imgHtml = "";
                   
                    response.data.forEach(album => {album.photos.data.forEach(photo => {
                   	 imgHtml = imgHtml  +' <div class=\"hovereffect\"><img style="height: 200px;width: 200px;border: solid;" class="img-responsive images" name="upload" value="' + photo.id + '" src="' + photo.images[photo.images.length - 1].source + '" onclick=imgOnclick("' + photo.images[photo.images.length - 1].source + '","' + photo.id + '") /><div class=\"overlay\"> <a class=\"info\" onclick=imgOnclick("' + photo.images[photo.images.length - 1].source + '","' + photo.id + '")>Suggest HashTag</a></div></div> ';
                      //me/albums?fields=photos{images}
                      //me/albums?fields=cover_photo{images}
                   })})
                   
                   document.getElementById('imageDiv').innerHTML =  imgHtml;
                   document.getElementById('form').style.display="none"

               }
           );

       }
        function getFileNameWithExt(event) {

            if (!event || !event.target || !event.target.files || event.target.files.length === 0) {
                return;
            }

            var name = event.target.files[0].name;
            document.getElementById("fileName").value = name;


        }


    </script>


    <div id="form" class="wrapper">
     <h2>HashTag-Suggester</h2>

        <div class="ways">
            <ul>
                <li class="active">
                     Image from Computer
                </li>
                <li>
                     Image from Facebook
                </li>
            </ul>
        </div>

        <div class="sections">
        

            <section class="active">
            <div class="file-upload-input,image-upload-wrap">
               <form action="<%= blobstoreService.createUploadUrl("/image") %>" method="post" enctype="multipart/form-data">
                    <!-- <input type="file" id="input-file-now" class="file-upload" name="myFile" onChange='getFileNameWithExt(event)'  />
                    <input type="hidden" id="fileName" name="fileName" />
                    <button  class="btn btn-outline-secondary" type="submit" value="Upload from Computer">
                 -->
              
  <input type="file" id="inputfile" class="file-upload,btn" name="myFile" onChange='getFileNameWithExt(event)' style="background-color:#FFC0CB" required="" />
   <input type="hidden" id="fileName" name="fileName" /> 
  <input  class="btn btn-outline-secondary" style=" border-radius: 15%; background: linear-gradient(to bottom, #FFC0CB 0%, #F0F8FF 100%);" type="submit" value="Upload"/> 
 
 
     </form>
            </div>
            </section>

            <section>

                    <div class="fb-login-button"
                            data-max-rows="1"
                            data-size="large"
                            data-button-type="continue_with"
                            data-use-continue-as="true"
                            data-scope="public_profile,email"
                            data-onlogin="checkLoginState();"
                    ></div>


            </section>

        </div>



    </div>

    </body>
</html>
