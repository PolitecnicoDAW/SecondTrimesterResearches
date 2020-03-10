<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 'on');


class getHRZones
{
    const NOMBRE_FICHERO = "12.06.2015 10_07.gpx";
    public $nombreFichero;
    public $gpx;
    public $xpath;
    public $lista;
    public $listaPuntosHR;
    public $listaHR;
    public $listaTimes;
    public $puntosTotales;
    public $puntos;
    private $datosUsuario;
    private $HRmax;

    public function __construct()
    {

        $this->datosUsuario = json_decode(file_get_contents("usuario.json"));
        $this->HRmax = 220 - (int)$this->datosUsuario->edad;


        //$this->calcularXpathQuerys();
        $this->calcularSimpleXML();
        //$this->puntosTotales = $this->listaPuntosHR->length;
        //$this->crearZonasHR();
    }

    private function calcularSimpleXML()
    {
        $gpx = simplexml_load_file(self::NOMBRE_FICHERO);
        $namespaces = $gpx->getDocNamespaces();
        $gpx->registerXPathNamespace('gpxtpx', $namespaces['gpxtpx']);
        foreach ($gpx->trk->trkseg->trkpt as $punto) {
            print_r((string)$punto->time);
            echo PHP_EOL;
            print_r((int)$punto->extensions->TrackPointExtension->hr);
            die();
        }
    }

    private function calcularXpathQuerys()
    {
        $gpx = new DOMDocument();
        $gpx->load(self::NOMBRE_FICHERO);
        $xpath = new DOMXPath($gpx);
        $xpath->registerNamespace("default", "http://www.topografix.com/GPX/1/1");
        $listaPuntosHR = $xpath->query("/default:gpx/default:trk/default:trkseg/default:trkpt//gpxtpx:hr/parent::gpxtpx:TrackPointExtension/parent::default:extensions//parent::default:trkpt");
        foreach ($listaPuntosHR as $puntos) {
            foreach ($puntos->childNodes as $nodo) {
                $tags[(string)$nodo->nodeName] = $nodo->nodeValue;
            }
            $this->lista[serialize(new DateTime($tags['time']))] = $tags['extensions'];
        }
        print_r($this->lista);
        //---$this->listaHR = $this->xpath->evaluate("/default:gpx/default:trk/default:trkseg/default:trkpt//gpxtpx:hr");
        // $this->listaTimes = $this->xpath->query("//default:time", $this->listaPuntosHR->item(0));
        //---$this->listaTimes = $this->xpath->query("/default:gpx/default:trk/default:trkseg/default:trkpt//gpxtpx:hr/parent::gpxtpx:TrackPointExtension/parent::default:extensions//parent::default:trkpt/default:time");
        /*foreach ($this->listaPuntosHR as $nodo) {
              $this->listaTiempos[] = $nodo->getElementsByTagName('time')->item(0)->nodeValue;
          }*/
        //otra forma de hacerlo
    }

    public function calcularTiempoCalorias()
    {
        for ($i = 1; $i < $this->puntosTotales; $i++) {
            $datos1 = $this->obtenerDatosHRTiempo($i - 1);
            $datos2 = $this->obtenerDatosHRTiempo($i);
            $mediaHR = $this->calculoMediaHR($datos1, $datos2);
            $zonaHR = $this->calcularHRZones($mediaHR);
            $intervaloTiempoActual = $this->calcularIntervaloTiempo($datos1, $datos2);

            $this->puntos[$zonaHR]["tiempo"] = $this->sumarIntervalosTiempo($this->puntos[$zonaHR]["tiempo"], $intervaloTiempoActual);
            $this->puntos[$zonaHR]["calorias"] += $this->calcularCalorias($intervaloTiempoActual, $mediaHR);
        }
        $this->calcularTotalCaloriasTiempo();
        print_r($this->puntos);
        file_put_contents("zones.json", json_encode($this->puntos, true));
    }

    private function calcularCalorias($tiempo, $hr)
    {
        if ($this->datosUsuario->sexo == "varón") {
            $totalCalorias = ((-55.0969 + (0.6309 * $hr) + (0.1988 * (int)$this->datosUsuario->peso) + (0.2017 * (int)$this->datosUsuario->edad)) / 4.184) * ($this->tiempoAsegundos($tiempo) / 3600) * 60;
        } else {
            $totalCalorias = ((-20.4022 + (0.4472 * $hr) + (0.1263 * $this->datosUsuario->peso) + (0.074 * $this->datosUsuario->edad)) / 4.184) * ($this->tiempoAsegundos($tiempo) / 3600) * 60;
        }
        return number_format($totalCalorias, 3);
    }

    private function calcularTotalCaloriasTiempo()
    {
        $totalCalorias = 0;
        $total = "00:00:00";
        for ($i = 1; $i <= 5; $i++) {
            $totalCalorias += $this->puntos[$i]["calorias"];
            $total = $this->sumarIntervalosTiempo($total, $this->puntos[$i]["tiempo"]);
        }
        $this->puntos["total"]["calorias"] = $totalCalorias;
        $this->puntos["total"]["tiempo"] = $total;
    }

    private function crearZonasHR()
    {
        for ($i = 1; $i <= 5; $i++) {
            $this->puntos[$i] = ["tiempo" => "00:00:00", "calorias" => 0];
        }
    }

    private function obtenerDatosHRTiempo($posicion)
    {
        return ["hr" => $this->listaHR[$posicion]->textContent, "tiempo" => $this->listaTimes->item($posicion)->textContent];
    }

    private function calculoMediaHR($datos1, $datos2)
    {
        return ($datos1["hr"] + $datos2["hr"]) / 2;
    }

    private function calcularIntervaloTiempo($datos1, $datos2)
    {//calculo de intervalo entre los dos datetime del XML
        $datetime1 = new DateTime($datos1["tiempo"]);
        $datetime2 = new DateTime($datos2["tiempo"]);
        $interval = $datetime1->diff($datetime2);
        return $interval->format('%H:%I:%S');
    }

    private function sumarIntervalosTiempo($tiempo1, $tiempo2)
    {//sumamos los dos Strings de tiempo
        $tiempoX = new DateTime($tiempo1);
        $tiempoY = new DateTime($tiempo2);
        //como no podemos sumar datetimes, los pasamos a intervalos
        $intervalo1 = $tiempoX->diff(new DateTime('00:00:00'));
        $intervalo2 = $tiempoY->diff(new DateTime('00:00:00'));
        //y los sumamos a un tiempo base de 00:00:00
        $tiempoBase = new DateTime('00:00');
        $tiempoBaseClonado = clone $tiempoBase;
        $tiempoBase->add($intervalo1);
        $tiempoBase->add($intervalo2);
        $total = $tiempoBaseClonado->diff($tiempoBase)->format("%H:%I:%S");
        //la diferencia de tiempo entre 00:00:00 y la suma de los otros tiempos, será el total
        return $total;
    }

    private function tiempoAsegundos($tiempo)
    {//obtenemos los segundos transcurridos en el datetime pasado
        $tiempoBase = new DateTime('00:00:00');
        $totalTiempo = new DateTime($tiempo);
        return $totalTiempo->getTimestamp() - $tiempoBase->getTimestamp();
    }

    private function calcularHRZones($mediaHR)
    {
        $zona = 0;
        //echo $mediaHR;
        if ($mediaHR < ($this->HRmax * 0.6)) {
            $zona = 1;
        } elseif (($mediaHR >= ($this->HRmax * 0.6)) && ($mediaHR < ($this->HRmax * 0.7))) {
            $zona = 2;
        } elseif (($mediaHR >= ($this->HRmax * 0.7)) && ($mediaHR < ($this->HRmax * 0.8))) {
            $zona = 3;
        } elseif (($mediaHR >= ($this->HRmax * 0.8)) && ($mediaHR < ($this->HRmax * 0.9))) {
            $zona = 4;
        } elseif ($mediaHR >= ($this->HRmax * 0.9)) {
            $zona = 5;
        }
        return $zona;
    }


}

$inicio = microtime(true);

$getHRZones = new getHRZones();
//$getHRZones->calcularTiempoCalorias();
$final = number_format(microtime(true) - $inicio, 4);
echo $final . " segundos." . PHP_EOL;
