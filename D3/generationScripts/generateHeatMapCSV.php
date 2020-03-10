<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 'on');


class GetHRZones
{
    public $archivo;
    private $HRmax;
    public $listaPuntos;
    public $totalTiempoPorIntervalo;
    public $totalIntervalos;
    public $arrayIntervalos;

    public function __construct()
    {
    }

    private function calcularXpathQuerys()
    {
        $gpx = new DOMDocument();
        $gpx->load($this->archivo);
        $xpath = new DOMXPath($gpx);
        $xpath->registerNamespace("default", "http://www.topografix.com/GPX/1/1");
        $listaPuntosConHR = $xpath->query("/default:gpx/default:trk/default:trkseg/default:trkpt//gpxtpx:hr/parent::gpxtpx:TrackPointExtension/parent::default:extensions//parent::default:trkpt");
        $listaPuntos=[];
        foreach ($listaPuntosConHR as $punto) {
            $listaPuntos[] = [
                "time"=>(new DateTime($punto->getElementsByTagName("time")->item(0)->nodeValue))->format("U"),
                "hr"=>$punto->getElementsByTagName("hr")->item(0)->nodeValue
            ];
        }
        $this->listaPuntos = $listaPuntos;
    }

    public function calcularIntervalos($numeroDeIntervalos) {
        $tiempoTotal = end($this->listaPuntos)["time"]-$this->listaPuntos[0]["time"];
        $resultadoCSV = [];
        $totalTiempoPorIntervalo=$tiempoTotal/$numeroDeIntervalos;
        $this->totalTiempoPorIntervalo=$totalTiempoPorIntervalo;
        $this->totalIntervalos=$numeroDeIntervalos;
        for ($i=0;$i<$numeroDeIntervalos;$i++) {
            $resultadoCSV[]=[
                "limiteInferior"=>$i*$totalTiempoPorIntervalo,
                "limiteSuperior"=>($i+1)*$totalTiempoPorIntervalo,
                "zonas"=>[]
            ];
        }
       $this->arrayIntervalos=$resultadoCSV;
        $this->rellenarIntervalos();
    }

    public function rellenarIntervalos() {
        $totalPuntos = count($this->listaPuntos);
        for ($i=0; $i<$totalPuntos-1;$i++) {
            $tiempo = $this->listaPuntos[$i+1]["time"]-$this->listaPuntos[0]["time"];
                $intervalo = $this->clasificarTiempoSegunIntervalo($tiempo);
                $zona = $this->HRtoZona($this->listaPuntos[$i+1]["hr"]+$this->listaPuntos[$i]["hr"]/2);
                $valorDeTiempoAnterior=$this->arrayIntervalos[$intervalo]["zonas"][$zona];
                $valorDeTiempoNuevo=$this->listaPuntos[$i+1]["time"]-$this->listaPuntos[$i]["time"];
                $this->arrayIntervalos[$intervalo]["zonas"][$zona]=
                    ($valorDeTiempoAnterior!==null)?
                        $valorDeTiempoAnterior+$valorDeTiempoNuevo:
                        $valorDeTiempoNuevo;

        }
        $this->ajustarValoresATantoPorCiento();
    }

    public function ajustarValoresATantoPorCiento() {
        print_r($this->arrayIntervalos);
        for($i=0;$i<count($this->arrayIntervalos);$i++) {
            $sumaTiemposZonas=0;
            foreach ($this->arrayIntervalos[$i]["zonas"] as $tiempo) {
                $sumaTiemposZonas+=$tiempo;
            }
            echo $sumaTiemposZonas." ";
            for ($x=1;$x<=5;$x++) {
                $this->arrayIntervalos[$i]["zonas"][$x]=($this->arrayIntervalos[$i]["zonas"][$x]*100)/$sumaTiemposZonas;
            }
        }
        print_r($this->arrayIntervalos);

    }

    public function clasificarTiempoSegunIntervalo($tiempo) {
        for ($i=0;$i<count($this->arrayIntervalos);$i++) {
            if ($tiempo<=$this->arrayIntervalos[$i]["limiteSuperior"] && $tiempo>$this->arrayIntervalos[$i]["limiteInferior"]) {
                return $i;
                break;
            }
        }
    }

    public function obtenerCSV(){
        if (file_exists("../DATAS/heatmapcsv.csv")) {
            unlink("../DATAS/heatmapcsv.csv");
            unlink("../DATAS/heatmapcsv.json");
        }
        $keys=[];
        file_put_contents("../DATAS/heatmapcsv.csv","group,variable,value".PHP_EOL,FILE_APPEND);
        foreach($this->arrayIntervalos as $intervalo) {
            $key = round(($intervalo["limiteInferior"]/3600),2)."-".round(($intervalo["limiteSuperior"]/3600),2)." hrs";
            $keys[]=$key;
            foreach($intervalo["zonas"] as $zone=>$value) {
                file_put_contents("../DATAS/heatmapcsv.csv",($zone).",".$key.",".$value.PHP_EOL,FILE_APPEND);
            }
        }
        file_put_contents("../DATAS/heatmapcsv.json",json_encode($keys));
    }


    public function HRtoZona($mediaHR)
    {
        $zona = 0;
        //echo $mediaHR;
        if ($mediaHR < ($this->HRmax * 0.6)) {
            $zona = 1;
        } elseif (($mediaHR < ($this->HRmax * 0.7))) {
            $zona = 2;
        } elseif (($mediaHR < ($this->HRmax * 0.8))) {
            $zona = 3;
        } elseif (($mediaHR < ($this->HRmax * 0.9))) {
            $zona = 4;
        } elseif ($mediaHR >= ($this->HRmax*0.9)) {
            $zona = 5;
        }
        return $zona;
    }

    public function obtenerHeatMapCSV($edad,$archivo) {
        $this->archivo = $archivo;
        $this->HRmax = 220-$edad;
        $this->calcularXpathQuerys();
        $this->calcularIntervalos(60);
        $this->obtenerCSV();
    }

    public function obtenerHeatMapJSON($edad, $archivo) {
        $this->archivo = $archivo;
        $this->HRmax = 220-$edad;
        $this->calcularXpathQuerys();
        $this->calcularIntervalos(60);
    }
}
$csv = new GetHRZones();
$csv->obtenerHeatMapJSON(25,"../DATAS/ejemplo.gpx");