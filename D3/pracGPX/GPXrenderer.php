<?php
ini_set('error_reporting', E_ALL ^ E_NOTICE ^ E_DEPRECATED);
ini_set('display_errors', 'on');

class RenderizadorTrackPoints
{
    public $points;
    public $trackpoints;
    public $puntosSinRenderizar;
    public $inputFile;

    public function __construct($inputFile, $author = "desconocido")
    {
        $this->author = $author;
        $this->inputFile = $inputFile;
        @$this->points = new SimpleXMLElement(file_get_contents($inputFile));
        $this->trackpoints = $this->points->trk->trkseg;
        $this->puntosSinRenderizar = count($this->trackpoints->trkpt);
    }
    //Calcula la media de las distancias entre puntos, para ello no tiene en cuenta
    //aquellos puntos que den una distancia de 0. Además hay que tener en cuenta que se divide el total
    //de las distancias por el total de puntos MENOS UNO, porque las distancias son segmentos:
    //   Si tenemos dos distancias, estas estarán definidas por tres puntos, pero su media se hace como:
    //      (distanciaP1-P2)+(distanciaP2-P3)/2
    function calcularMedia()
    {
        $total = 0;
        $distancia = 0;
        for ($i = 1; $i < count($this->trackpoints->trkpt) - 1; $i++) {
            $distanciaPuntos = $this->calcularDistanciaPitagoras($this->trackpoints->trkpt[$i - 1], $this->trackpoints->trkpt[$i]);
            $total += ($distanciaPuntos != 0) ? 1 : 0;
            /*
             * No tenemos en cuenta los puntos que dan distancia 0 para hacer la media!
             * */
            $distancia += $distanciaPuntos;
        }
        return $distancia / ($total - 1);
    }

    /*No calculo la distancia teniendo en cuenta curvatura terrestre por dos razones:
    *   Son puntos muy cercanos, con lo que la curvatura importará poco
     *  Tardaría más en realizar los cálculos
     *
    */
    function calcularDistanciaPitagoras($trackpoint1, $trackpoint2)
    {
        $lat2 = (float)$trackpoint2["lat"];
        $lon2 = (float)$trackpoint2["lon"];
        $lat1 = (float)$trackpoint1["lat"];
        $lon1 = (float)$trackpoint1["lon"];
        return sqrt(pow(($lat2 - $lat1), 2) + pow(($lon2 - $lon1), 2));
    }

    function renderizar($media, $posicion = 0)
    {
        $total = count($this->trackpoints->trkpt);
        echo "total-->" . $total . PHP_EOL;
        //Comenzamos siempre comparando el punto cero, con el siguiente, de ahí el i=posicion+1
        //el máximo para comparar es el total menos uno siempre que i sea menor que este valor,
        //con esto nos aseguramos de coger siempre el ultimo punto:
        //      En un array de 100 elementos, el total es 100 pero la ultima posicion es 99
        //      Si nunca queremos comparar con esa posicion, repetimos el bucle siempre que
        //      i sea menor de 100(el total)-1=99, con lo que nos detendremos en el 98.
        for ($i = $posicion + 1; $i < $total - 1; $i++) {
            $distancia = $this->calcularDistanciaPitagoras($this->trackpoints->trkpt[$posicion], $this->trackpoints->trkpt[$i]);
            echo "posicion: " . $posicion . " i: " . $i . PHP_EOL;
            //si la distancia es mayor o igual a la media, queremos ese punto,
            // con lo que llamamos de nuevo a la funcion pasándole el punto que estamos comparando,
            //Para que COMIENCE DESDE AHÍ en la siguiente iteración.
            //
            if ($distancia >= $media) {
                echo $distancia . ">=" . $media . PHP_EOL;
                $this->renderizar($media, $i);
                //Aunque se llame a la funcion, la ejecucion actual no termina,
                // con lo que resulta en bucle de bucles si no se pone el break
                break;
                //Si la distancia no es mayor que la media, deshechamos el punto,
                //ésto se hace con un unset directamente sobre el objeto SimpleXML.
            } else {
                echo "unsetting: " . $i . PHP_EOL;
                unset($this->trackpoints->trkpt[$posicion]);
                //tenemos que restar uno al puntero, puesto que al eliminar un elemento del array,
                //las keys se resetean, y el siguiente elemento que queremos comparar baja uno en posicion,
                //con lo que restamos uno para quedarnos donde estamos y apuntar al nuevo elemento.
                $i--;
            }
        }
    }

    //El factor de calidad es para controlar la cantidad de puntos que se eliminan o acepta:
    /*
     * Se multiplica por la media, de manera que si es superior a uno, la media queda más
     * grande que la original, lo que hace que se admitan menos puntos. De la misma manera, si es
     * menor de uno, la media queda más pequeña que la original, lo que hace que se admitan más puntos.
     *
     * */
    function renderizarTrackPoints($factorCalidad = 1)
    {
        require_once("Chrono.class.php");
        $myChrono = new Chrono("media.json", "log.json");
        $myChrono->setInicio();
        $media = $this->calcularMedia();
        $myChrono->getTime("calcular la media");
        $this->renderizar($media * $factorCalidad);
        $myChrono->getTime("renderizar");
        echo "sin renderizar--> " . $this->puntosSinRenderizar . PHP_EOL . "renderizados--> " . count($this->trackpoints->trkpt) . PHP_EOL;
        $nombre = basename($this->inputFile, ".gpx");
        $this->points->asXML($nombre . ".min.gpx");
        $myChrono->getTime("escribir GPX min");
        $ciudadesCercanas = $this->obtenerCiudadesCercanas();
        $myChrono->getTime("obtener Ciudades Cercanas via WsCllerandy");
        $json = ["autor" => $this->author, "ciudadesCercanas" => $ciudadesCercanas];
        file_put_contents($nombre . ".json", json_encode($json));
        $myChrono->getTime("escribir json");
        $myChrono->chronoStop();
    }

    //Usamos el WSgetCiudadCercana.php de Cllerandy (￣▽￣)ノ
    function obtenerCiudadesCercanas()
    {
        $ch = curl_init();
        $ciudadesCercanas = [];
        for ($i = 0; $i < count($this->trackpoints->trkpt); $i++) {
            curl_setopt($ch, CURLOPT_URL, "https://cllerandi.ddns.net/dwes/pracEXIF/WSgetCiudadCercana.php");
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, "lat=" . $this->trackpoints->trkpt[$i]["lat"] . "&lon=" . $this->trackpoints->trkpt[$i]["lon"]);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $datosCiudad = json_decode(curl_exec($ch), true);
            //si la distancia que se ha obtenido para la ciudad es
            // más pequeña que la que se tenía o no había una distancia para esa ciudad
            // se pone la nueva distancia, si no, se queda la que estaba.
            $ciudadesCercanas[$datosCiudad["datos"]["CIUDADCT"]] =
                ($datosCiudad["datos"]["distance"] <= $ciudadesCercanas[$datosCiudad["datos"]["CIUDADCT"]]) ||
                ($ciudadesCercanas[$datosCiudad["datos"]["CIUDADCT"]] == null) ?
                    $datosCiudad["datos"]["distance"] :
                    $ciudadesCercanas[$datosCiudad["datos"]["CIUDADCT"]];
        }
        curl_close($ch);
        return $ciudadesCercanas;
    }

}

$renderizador = new RenderizadorTrackPoints("12.06.2015 10_07.gpx", "Sergio");
$renderizador->renderizarTrackPoints();

