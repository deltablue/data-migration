<?php
// Verbindungsaufbau und Auswahl der Datenbank
$dbconn = pg_connect("host=127.0.0.1 dbname=postgres user=postgres password=postgres")
    or die('Verbindungsaufbau fehlgeschlagen: ' . pg_last_error());

// Eine SQL-Abfrge ausfühen
$query = 'SELECT date_key_status, subtotal_net_u_model FROM ap_mr.t_096_tabelle WHERE subtotal_net_u_model > 0 LIMIT 10';
$result = pg_query($query) or die('Abfrage fehlgeschlagen: ' . pg_last_error());

// Ergebnisse in HTML ausgeben
echo "<table>\n";
while ($line = pg_fetch_array($result, null, PGSQL_ASSOC)) {
    echo "\t<tr>\n";
    foreach ($line as $col_value) {
        echo "\t\t<td>$col_value</td>\n";
    }
    echo "\t</tr>\n";
}
echo "</table>\n";

// Speicher freigeben
pg_free_result($result);

// Verbindung schließen
pg_close($dbconn);
?>

