<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>PiPlayer</title>
        <link rel="stylesheet" href="main.css">

        <?php
        #Make Connection to database
        $con = mysqli_connect("localhost","phpmyadmin","raspipass","PiPlayer");
        $result = mysqli_query($con , "SELECT * FROM title_list");

        #Function for button Click
        function Stop(){
            exec('mpc stop');
        };
        function Toggle(){
            exec('mpc toggle');
        };
        function VolUp(){
            exec('mpc volume +5');
        }
        function VolDown(){
            exec('mpc volume -5');
        }
        function play_a_song($songname){
            exec('mpc clear');
            exec('mpc add '.$songname);
            Toggle();
        }

        #Check for button Click
        if (isset($_POST['stop'])) {
            Stop();
        }
        if (isset($_POST['toggle'])) {
            Toggle();
        }
        if (isset($_POST['VolUp'])) {
            VolUp();
        }
        if (isset($_POST['VolDown'])) {
            VolDown();
        }
        if (isset($_POST['play_song'])) {
            play_a_song($_POST['play_song']);
        }


        ?>
    </head>
    <body>
        <!-- The Bar ontop of the screen  -->
        <div class="topbar">
            <a href="/"><h1>PiPlayer</h1></a>
        </div>
        <!-- The Bar on the bottom of the screen -->
        <div class="botbar">
            <form action="" method="POST">
                <button type="submit" name="toggle"><img src="https://www2.pic-upload.de/img/34288494/playbutton.png" alt=""></button>
                <button type="submit" name="stop"><img src="https://www2.pic-upload.de/img/34288713/stopbutton.png" alt=""></button>
                <button type="submit" name="VolUp"><img src="https://www2.pic-upload.de/img/34288731/VolUpbutton.png" alt=""></button>
                <button type="submit" name="VolDown"><img src="https://www2.pic-upload.de/img/34288730/VolDownbutton.png" alt=""></button>
            </form>
        </div>

        <div class="mainframe">
            <!-- Main Boxes in formes of Text etc... -->

            <?php
            #For every entry in the database list do ...
            while ($row=mysqli_fetch_array($result)) {
                echo "<div class='titlebox'>
                    <div class='namecontain'>
                    <p>".$row['Name']."</p>
                    </div>
                    <div class='buttoncontain'>
                        <form action='' method='POST'>
                            <button name='play_song' value='".$row['filename']."' type='submit'><b>Play</b></button>
                        </form>
                    </div>
                </div>

                ";
                }

            ?>

        </div>

    </body>
</html>
