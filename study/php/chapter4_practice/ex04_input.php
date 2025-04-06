<?php require "../header.php"; ?>

<form action="ex04_output.php">
    <p><label>座席を指定してください<br>
        <select name="seat">
            <!--セレクトボックス-->
            <option value="自由席">自由席</option>
            <option value="指定席">指定席</option>
            <option value="グリーン席">グリーン席</option>
        </select>
    </label></P>    
    <input type="submit" value="確定">
</form>

<?php require "../footer.php"; ?>