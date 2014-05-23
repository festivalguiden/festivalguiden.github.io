<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 //EN">
<html class="no-js" lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Ålesund brenner</title>
  <link rel="stylesheet" href="http://dag.myplayground.no/css/foundation.css" />
  <link rel="stylesheet" href="http://dag.myplayground.no/css/smplab.css" />
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>


  <script src="http://dag.myplayground.no/js/modernizr.js"></script>
  <script src="js/instafeed.min.js"></script>
  <script type="text/javascript">
   var a = Math.ceil(Math.random() * 10);
    var b = Math.ceil(Math.random() * 10);       
    var c = a + b
    function DrawBotBoot()
    {
        document.write("Hva er "+ a + " + " + b +"? ");
        document.write("<input id='BotBootInput' type='text' style='width:45px;' maxlength='2' size='2'/>");
    }    
    function ValidBotBoot(){
        var d = document.getElementById('BotBootInput').value;
        if (d == c) return true;        
        return false;
        
    } </script>

  <link href="img/favicon.ico" rel="icon" type="image/x-icon" />
  <link href='http://fonts.googleapis.com/css?family=PT+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>

</head>

<body class="bg1">
  <div class="row show-for-medium-up">
    <div class="large-12 columns logo">
      <img src="img/logo.png">
    </div>
  </div>

  <div class="row">
    <div class="fixed">
      <nav class="top-bar" data-topbar="">
        <ul class="title-area">
          <li class="name show-for-small">
            <h1><a href="#"></a></h1>
          </li>
          <li class="toggle-topbar menu-icon"><a href="#"><span></span></a></li>
        </ul>

        
      <section class="top-bar-section">
          <!-- Right Nav Section -->

          <!-- Left Nav Section -->
          <ul>
            <li><a style="background: #ec931d;" href="http://interaktiv.smp.no/bybrann/index.html">TILBAKE TIL FORSIDEN</a></li>
          </ul>
        </section></nav>
    </div>

    </div>
  </div>


<%
Dim posted 
posted = false




If NOT IsEmpty(Request.Form("tekst")) Then
    
    
    posted = true
    tekst = request.form("tekst")
    navn = request.form("navn")
    epost = request.form("epost")
    tlf = request.form("tlf")

    
'response.write(tekst & " " & navn & " " & epost & " " & tlf)

Session.Timeout=5


IF (Session("posted")) Then

'response.write("posted is true")

end if


IF not(Session("posted")) Then

'response.write("posted is false")

end if


If NOT(Session("posted")) Then
Session("posted") = true
  Set Mail=CreateObject("CDO.Message")
  Mail.Subject="Del dine historier"
  Mail.From=epost
  Mail.To="Eirik.Meling@smp.no"
  'Mail.Bcc="someone1@domain.com"
  'Mail.Cc=someone2@domain.com
  'Mail.ReplyTo ="replyto@domain.com"
  'Mail.TextBody= tekst & "\nTelefon:" & tlf & "\n"
  Mail.HTMLBody= tekst & "<br>Telefon:" & tlf & "<br>"
  Mail.Send
  set Mail =nothing

End if

       
End If


'remove for testing :'

'Session("posted") = false
'Session.Contents.Remove("posted")
%>


<!-- Row Layout for forms -->

<div class="row" style="border:2px solid;border-radius:25px;max-width:900px;border-color:#ec931d">
<div class="large-12 colums ">
<%If (Session("posted")) Then%>

        <div class="small-9 columns" style="padding:20px;">
        <h2>Del dine historier</h2>
   <p>    Takk for delte din historie fra brannen.
</p>

   <p> Alle tekstene vil bli gjennomgått før de eventuelt blir publisert på bybrann.smp.no.
</p>


        </div>


<%end if%>



<%If NOT(Session("posted")) Then%>
<form  id="commentForm" method="post">
  <div class="row">
    <div class="small-8">
      <div class="row ">
        <div class="small-3 columns">

        </div>
        <div class="small-9 columns" style="padding:20px;">
        <h2>Del dine historier</h2>
   <p>     Mange ålesundere har nære forfedre og slekt som opplevde dramaet. Her kan du dele din bybrannhistorie, samtidig bidrar du til å ta vare på fortellingen om Ålesund.

Legg inn din historie og kontaktinformasjon i feltene under:

</p>

        </div>
      </div>
    </div>
  </div>


  <div class="row">
    <div class="small-8 ">
      <div class="row ">
        <div class="small-3 columns">
          <label for="right-label" class="right inline">Din historie</label>
        </div>
        <div class="small-9 columns">
          <textarea minlenght="5" id="tekst" value="din historie" name="tekst" rows="20" cols="50" style="width: 600px;height: 120px;"></textarea>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="small-8 ">
      <div class="row ">
        <div class="small-3 columns">
          <label for="right-label" class="right inline">Navn</label>
        </div>
        <div class="small-9 columns">
          <input type="text" id="navn" name="navn" value="">
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="small-8 ">
      <div class="row ">
        <div class="small-3 columns">
          <label for="right-label" class="right inline">Tlf</label>
        </div>
        <div class="small-9 columns">
          <input type="text" id="tlf" name="tlf">
        </div>
      </div>
    </div>
  </div>

<div class="row">
    <div class="small-8 ">
      <div class="row ">
        <div class="small-3 columns">
          <label for="right-label" class="right inline">E-post</label>
        </div>
        <div class="small-9 columns">
          <input type="email" id="epost" name="epost" value="">
        </div>
      </div>
    </div>
  </div>


<div class="row">
    <div class="small-8 ">
      <div class="row ">
        <div class="small-3 columns">
        
        </div>
        <div class="small-9 columns">
       <!--   <script type="text/javascript">DrawBotBoot()</script> -->
          <input type="submit" value="Del din historie" class="button radius submit"/>
        </div>
      </div>
    </div>
  </div>

</form>
<%end if%>


</div>
</div>
<!-- scripts start -->

       
        <script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.0.2/js/foundation.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/foundation/5.0.2/js/foundation/foundation.orbit.min.js"></script>
       
        

<script>


$.validator.setDefaults({
  submitHandler: function() { alert("submitted!"); }
});

$().ready(function() {
  // validate the comment form when it is submitted
  //$("#commentForm").validate();

  // validate signup form on keyup and submit
  $("#commentForm").validate({
    rules: {
      navn: "required",
      epost: {
        required: true,
        epost: true
      },
       tekst: "required",
      minlength: 5
    },
    messages: {
      navn: "Vennligst tast inn ditt navn",
      tekst: {
        required: "Please enter a txt",
        minlength: "Your username must consist of at least 2 characters"
      },
      epost: "Vennligst tast inn din epost adresse"
    }
  });

  
</script>

</body>
</html>
