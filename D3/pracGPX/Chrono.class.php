<?php
ini_set('error_reporting', E_ALL ^ E_NOTICE ^ E_WARNING);
ini_set('display_errors', 'on');
class Chrono {
    public $resultados=[];
    public $json;
    public $log;
    public $archivo;
    public $media;
    public $inicio;

    public function __construct($archivo, $log) {
        $this->json = json_decode(file_get_contents($log),true);
        $this->log = $log;
        $this->archivo = $archivo;
    }
    function setInicio() {
        $this->inicio = microtime(true);
    }

    function getTime($texto) {
        $this->resultados[$texto] = microtime(true) - $this->inicio;
        $this->inicio = microtime(true);
    }

    function writeToJson() {
        $this->json[] =$this->resultados;
        file_put_contents($this->log,json_encode($this->json));
    }

    function hacerMedia() {
        $media=[];
        if (count($this->json)==1) {
            $media = $this->json[0];
        }
        for ($i=1;$i<count($this->json);$i++) {
            foreach($this->json[$i] as $punto=>$time) {
                $media[$punto]+= $time;
            }
        }
        foreach ($media as $key=>$value){
            $media[$key]=$media[$key]/(count($this->json));
        }
        $this->media=$media;
        file_put_contents($this->archivo,json_encode($media));
    }

    function makeStatistics() {
        $tiempoMasRapido = array_search(min($this->media),$this->media);
        $tiempoMasLento = array_search(max($this->media),$this->media);
        echo "\n--------------------------\n";
        echo "\nel proceso más rápido es: ".$tiempoMasRapido." con: ".($this->media[$tiempoMasRapido])."\n";
        echo "\nel proceso más lento es: ".$tiempoMasLento." con: ".($this->media[$tiempoMasLento])."\n";
        $mediaTotal = 0;
        foreach($this->media as $key=>$value) {
            $mediaTotal += $value;
        }
        echo "\nel proceso global tarda: ".($mediaTotal)."\n";
        echo "\n--------------------------\n";

    }
    function chronoStop() {
        $this->writeToJson();
        $this->hacerMedia();
        $this->makeStatistics();
    }
}