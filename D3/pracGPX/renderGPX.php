<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 'on');

const NOMBRE_FICHERO = "12.06.2015 10_07.gpx";


class RenderGPX
{
    public $nombreFichero;
    public $gpx;
    public $xpath;
    public $listaPuntos;
    public $resultados;

    public function __construct($rutaArchivoGPX)
    {
        $this->nombreFichero = $rutaArchivoGPX;
        $this->gpx = new DOMDocument();
        $this->gpx->load($rutaArchivoGPX);
        $this->xpath = new DOMXPath($this->gpx);
        $this->xpath->registerNamespace("default", "http://www.topografix.com/GPX/1/1");

        $this->listaPuntos = $this->xpath->query("/default:gpx/default:trk/default:trkseg/default:trkpt");
        $this->resultados["PUNTOS_TOTALES"] = $this->listaPuntos->length;
    }


    public function renderizarGPX()
    {
        // Sacamos lat y lon del primer punto
        $ultimoPunto = $this->sacarLonLat(0);

        $distanciaTotal = 0;

        $contador = 1;

        for ($x = 1; $x < $this->listaPuntos->length; $x++) {
            $puntoActual = $this->sacarLonLat($x);
            $contador++;
            $distanciaTotal += $this->calcularDistancia($puntoActual, $ultimoPunto);

            $ultimoPunto = $puntoActual;
        }
        $this->resultados["DISTANCIA_TOTAL"] = $distanciaTotal;
        $this->resultados["MEDIA_DISTANCIA"] = $distanciaTotal / $this->listaPuntos->length;

        print_r($this->resultados);
    }

    public function generarGPXMinificado()
    {
        $ultimoPunto = $this->sacarLonLat(0);

        for ($x = 1; $x < $this->listaPuntos->length; $x++) {
            $puntoActual = $this->sacarLonLat($x);
            $distancia = $this->calcularDistancia($puntoActual, $ultimoPunto);

            if ($distancia < $this->resultados["MEDIA_DISTANCIA"]) {
                $esteNodo = $this->listaPuntos->item($x);
                $esteNodo->parentNode->removeChild($esteNodo);
            }

            $ultimoPunto = $puntoActual;
        }

        $this->gpx->save($this->generarNuevoNombre());
    }

    // Perdí mucho tiempo con la librería así que esta parte me la han cedido Sergio y Alex A.
    // Gracias juapos
    public function calcularDistancia($ubicacion1, $ubicacion2)
    {
        $lat1 = (float)$ubicacion1["lat"];
        $lon1 = (float)$ubicacion1["lon"];

        $lat2 = (float)$ubicacion2["lat"];
        $lon2 = (float)$ubicacion2["lon"];

        $latFrom = deg2rad($lat1);
        $lonFrom = deg2rad($lon1);
        $latTo = deg2rad($lat2);
        $lonTo = deg2rad($lon2);

        $latDelta = $latTo - $latFrom;
        $lonDelta = $lonTo - $lonFrom;

        $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
        return $angle * 6371000; //Le añado otros tres ceros para que me lo devuelva en metros, me resulta más cómodo
//        return $angle * 6371;
    }

    public function sacarLonLat($posicion)
    {
        return [
            "lat" => $this->listaPuntos->item($posicion)->attributes->getNamedItem("lat")->nodeValue,
            "lon" => $this->listaPuntos->item($posicion)->attributes->getNamedItem("lon")->nodeValue
        ];
    }

    public function crearPunto($lon, $lat)
    {
        return geoPHP::load("POINT($lon $lat)", "wkt");
    }

    public function generarNuevoNombre()
    {
        $nombrePartido = str_split($this->nombreFichero, strlen($this->nombreFichero) - 4);
        $nombrePartido[2] = $nombrePartido[1];
        $nombrePartido[1] = '.min';
        return join("", $nombrePartido);
    }
}

$renderGPX = new RenderGPX(NOMBRE_FICHERO);
$renderGPX->renderizarGPX();
$renderGPX->generarGPXMinificado();