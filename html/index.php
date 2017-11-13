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
        function Play(){
            exec('mpc play');
        };
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
        if (isset($_POST['play'])) {
            Play();
        };
        if (isset($_POST['stop'])) {
            Stop();
        };
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
                <input type="submit" name="toggle" value="Play/Pause">
                <input type="submit" name="VolUp" value="Volume Up">
                <input type="submit" name="VolDown" value="Volume Down">
                <input type="submit" name="stop" value="stop">
            </form>
        </div>

        <div class="mainframe">
            <!-- Main Boxes in formes of Text etc... -->

            <?php
            #For every entry in the database list do ...
            while ($row=mysqli_fetch_array($result)) {
                echo "<div class='titlebox'><div class='inf'>
                ".$row['Name']."
                </div><div>
                <form action='' method='POST'>
                    <button name='play_song' value='".$row['filename']."' type='submit'>Play</button>
                </form>
                </div>
                </div>

                ";
                }

            ?>

        </div>

    </body>
</html>
