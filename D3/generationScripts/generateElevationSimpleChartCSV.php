<?php
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 'on');


class GetElevationChartCSV
{
    public $archivo;
    public $listaPuntosConEle;
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
        //$listaPuntosConHR = $xpath->query("/default:gpx/default:trk/default:trkseg/default:trkpt//gpxtpx:hr/parent::gpxtpx:TrackPointExtension/parent::default:extensions//parent::default:trkpt");
        $puntos = $xpath->query("/default:gpx/default:trk/default:trkseg/default:trkpt");
        $this->listaPuntosConEle=[];
        foreach ($puntos as $punto) {
            $this->listaPuntosConEle[]=[
                "ele"=>$punto->getElementsByTagName("ele")->item(0)->nodeValue,
                "time"=>(new DateTime($punto->getElementsByTagName("time")->item(0)->nodeValue))->format("U"),
            ];
        }
    }

    public function calcularIntervalos($numeroDeIntervalos) {
        $tiempoTotal = end($this->listaPuntosConEle)["time"]-$this->listaPuntosConEle[0]["time"];
        $resultadoCSV = [];
        $totalTiempoPorIntervalo=$tiempoTotal/$numeroDeIntervalos;
        $this->totalTiempoPorIntervalo=$totalTiempoPorIntervalo;
        $this->totalIntervalos=$numeroDeIntervalos;
        for ($i=0;$i<$numeroDeIntervalos;$i++) {
            $resultadoCSV[]=[
                "limiteInferior"=>$i*$totalTiempoPorIntervalo,
                "limiteSuperior"=>($i+1)*$totalTiempoPorIntervalo,
                "elevacion"=>[
                    "datos"=>[],
                    "media"=>0,
                    "desviacionEstandar"=>0,
                ],
            ];
        }
        $this->arrayIntervalos=$resultadoCSV;
        $this->rellenarIntervalos();
    }

    public function rellenarIntervalos() {
        $totalPuntos = count($this->listaPuntosConEle);
        for ($i=0; $i<$totalPuntos-1;$i++) {
            $tiempo = $this->listaPuntosConEle[$i]["time"]-$this->listaPuntosConEle[0]["time"];
            $intervalo = $this->clasificarTiempoSegunIntervalo($tiempo);
            $this->arrayIntervalos[$intervalo]["elevacion"]["datos"][]=$this->listaPuntosConEle[$i]["ele"];
        }
        //var_dump($this->arrayIntervalos);
        $this->calcularMediaYDesviacion();
        //print_r(count($this->arrayIntervalos));
    }

    public function calcularMediaYDesviacion() {
        for($i=0;$i<count($this->arrayIntervalos);$i++) {
            for ($x=0; $x<count($this->arrayIntervalos[$i]["elevacion"]["datos"]);$x++) {
                $this->arrayIntervalos[$i]["elevacion"]["media"]+=$this->arrayIntervalos[$i]["elevacion"]["datos"][$x];
            }
            $this->arrayIntervalos[$i]["elevacion"]["media"]=$this->arrayIntervalos[$i]["elevacion"]["media"]/count($this->arrayIntervalos[$i]["elevacion"]["datos"]);
            $sumaValoresMenosMediaAlCuadrado=0;
            for ($x=0; $x<count($this->arrayIntervalos[$i]["elevacion"]["datos"]);$x++) {
                $sumaValoresMenosMediaAlCuadrado+=pow(($this->arrayIntervalos[$i]["elevacion"]["datos"][$x]-$this->arrayIntervalos[$i]["elevacion"]["media"]),2);
            }
            $this->arrayIntervalos[$i]["elevacion"]["desviacionEstandar"]=sqrt(($sumaValoresMenosMediaAlCuadrado/count($this->arrayIntervalos[$i]["elevacion"]["datos"])));
        }
        print_r($this->arrayIntervalos);
    }

    public function clasificarTiempoSegunIntervalo($tiempo) {
        for ($i=0;$i<count($this->arrayIntervalos);$i++) {
            if ($tiempo<$this->arrayIntervalos[$i]["limiteSuperior"] && $tiempo>=$this->arrayIntervalos[$i]["limiteInferior"]) {
                return $i;
                break;
            }
        }
    }

    public function obtenerCSV(){
        if (file_exists("../DATAS/elevationChart.csv")) {
            unlink("../DATAS/elevationChart.csv");
            unlink("../DATAS/elevationChart.json");
        }
        $keys=[];
        file_put_contents("../DATAS/elevationChart.csv","x,y,CI_left,CI_right".PHP_EOL,FILE_APPEND);
        foreach($this->arrayIntervalos as $intervalo) {
            $key = round(($intervalo["limiteInferior"]/3600),2)."-".round(($intervalo["limiteSuperior"]/3600),2)." hrs";
            $keys[]=$key;
            $CI_inferior=$intervalo["elevacion"]["media"]-$intervalo["elevacion"]["desviacionEstandar"];
            $CI_superior=$intervalo["elevacion"]["media"]+$intervalo["elevacion"]["desviacionEstandar"];
            file_put_contents("../DATAS/elevationChart.csv",$key.",".$intervalo["elevacion"]["media"].",".$CI_inferior.",".$CI_superior.PHP_EOL,FILE_APPEND);
        }
        file_put_contents("../DATAS/elevationChart.json",json_encode($keys));
    }

    public function obtenerSimpleElevationChartCSV($archivo) {
        $this->archivo = $archivo;
        $this->calcularXpathQuerys();
        $this->calcularIntervalos(60);
        $this->obtenerCSV();
    }

    public function obtenerSimpleElevationChartJSON($archivo) {
        $this->archivo = $archivo;
        $this->calcularXpathQuerys();
        $this->calcularIntervalos(60);
    }
}
$csv = new GetElevationChartCSV();
$csv->obtenerSimpleElevationChartJSON("../DATAS/ejemplo.gpx");