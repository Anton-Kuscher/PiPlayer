<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="../main.css">
        <script type="text/javascript" src="jquery-3.2.0.min.js"></script>
        <script type="text/javascript" src="esgi-popupimage.js"></script>

        <title>Sankt Martin</title>
        <!--       <meta http-equiv="refresh" content="1">              -->

    </head>
    <body>

        <?php
        $con = mysqli_connect("localhost","phpmyadmin","raspipass","PiPlayer");
        $result = mysqli_query($con , "SELECT * FROM title_list");
        while($row=mysqli_fetch_array($result)) {
            echo $row['Name']."<br>";
            echo $row['filename']."<br><br><?php echo 'lol';?>";
        }
        ?>

         <script>
             $(document).ready(function(){
                $('.popupimage').esgi();
             });
         </script>



    </body>
</html>
