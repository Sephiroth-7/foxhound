<?php
    include "connexion.php";

    $name = $_POST['name'];
    $email = $_POST['email'];
    $pass = sha1($_POST['pass']);

     try {
        if(isset($name, $email, $pass)){
            // Requête pour vérifier qu'on a pas de doublon d'email
            $req = $db->prepare("SELECT * FROM users WHERE email=?");
            $req->execute(array($email));
             // Requête pour vérifier qu'on a pas de doublon de nom
            $req2 = $db->prepare("SELECT * FROM users WHERE nom=?");
            $req2->execute(array($name));
            $existMail = $req->rowCount();
            $existName = $req2->rowCount();


            if(($existMail == 0) && ($existName == 0)) {
                $req = $db->prepare("INSERT INTO users VALUES(null,?,?,?)");
                 $req->execute(array($name, $email, $pass));
                 if($req){
                     $succes = 1;
                     $msg = "succes register";
                 }else{
                     $succes = 0;
                     $msg = "error register";
                 }
            }elseif ($existMail != 0){
                $msg = "email already exist";
                $succes = 0;
            }
            else{
                $msg = "Name already exist";
                $succes = 0;
            }
       }else{
          $succes = 0;
          $msg = "error empty data";
       }
     } catch (\Throwable $th) {
        $succes = 0;
        $msg = "Error: ".$th->getMessage();
     }
     echo json_encode([
         "data"=>[
             $msg,
             $succes,
             $name,
             $email,
             $pass,
             $existMail,
             $existName,
         ]
         ]);

?>