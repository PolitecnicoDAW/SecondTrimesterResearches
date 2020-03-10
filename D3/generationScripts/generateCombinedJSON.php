<?php

ob_start();

require_once __DIR__ . "/generateElevationSimpleChartCSV.php";
require_once __DIR__ . "/generateHeatMapCSV.php";

ob_end_clean();

$heatMap = new GetHRZones();
$heatMap->obtenerHeatMapJSON(25,"../DATAS/ejemplo.gpx");
$elevation = new GetElevationChartCSV();
$elevation->obtenerSimpleElevationChartJSON("../DATAS/ejemplo.gpx");

$combinedData = array_map(function ($heatInterval, $elevationInterval) {
    ["zonas" => $hrZones] = $heatInterval;
    ["media" => $averageElevation, "desviacionEstandar" => $deviation] = $elevationInterval["elevacion"];

    $hrZones["averageElevation"]= $averageElevation;
    $hrZones["estimatedMaxElevation"]= $averageElevation + $deviation;
    $hrZones["estimatedMinElevation"]= $averageElevation - $deviation;

    return $hrZones;
}, $heatMap->arrayIntervalos, $elevation->arrayIntervalos);

file_put_contents(__DIR__ . "/../DATAS/combined.json", json_encode($combinedData));