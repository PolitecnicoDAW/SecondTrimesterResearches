class GraphGenerator {
    constructor(data = []) {
        this.timeAxis = data.map((_, index) => index === 0 ? "Ahora" : `+${index}`);
        this.data = data.slice();

        /* Heatmap config */

        this.marginHeatmap = { top: 30, right: 30, bottom: 30, left: 150 };
        this.widthHeatmap = 500 - this.marginHeatmap.left - this.marginHeatmap.right;
        this.heightHeatmap = 700 - this.marginHeatmap.top - this.marginHeatmap.bottom;

        this.heatmap = d3.select("#my_dataviz")
            .append("svg")
            .attr("width", this.widthHeatmap + this.marginHeatmap.left + this.marginHeatmap.right)
            .attr("height", this.heightHeatmap + this.marginHeatmap.top + this.marginHeatmap.bottom)
            .append("g")
            .attr("transform",
                "translate(" + this.marginHeatmap.left + "," + this.marginHeatmap.top + ")");

        /* Chart config */

        this.marginChart = { top: 60, right: 120, bottom: 90, left: 30 };
        this.widthChart = 810 - this.marginChart.left - this.marginChart.right;
        this.heightChart = 500 - this.marginChart.top - this.marginChart.bottom;

        this.chart = d3.select("#my_dataviz2")
            .append("svg")
            .attr("width", this.widthChart + this.marginChart.left + this.marginChart.right)
            .attr("height", this.heightChart + this.marginChart.top + this.marginChart.bottom)
            .append("g")
            .attr("transform",
                "translate(" + this.marginChart.left + "," + this.marginChart.top + ")");
    }

    startLoop(seconds = 1) {
        this.interval = setInterval(() => {
            const last = this.data.pop();
            this.data.unshift(last);
            this.drawHeatmap();
            this.drawChart();
        }, seconds * 1000);
        this.drawHeatmap();
        this.drawChart();
    }

    drawHeatmap() {
        this.heatmap.selectAll("*").remove();

        const heatGroups = ["1", "2", "3", "4", "5"];
        this.heatmapX = d3.scaleBand()
            .range([0, this.widthHeatmap])
            .domain(heatGroups)
            .padding(0.01);
        this.heatmap.append("g")
            .attr("transform", "translate(0," + this.heightHeatmap + ")")
            .call(d3.axisBottom(this.heatmapX));
        this.heatmapY = d3.scaleBand()
            .range([this.heightHeatmap, 0])
            .domain(this.timeAxis)
            .padding(0.01);
        this.heatmap.append("g")
            .call(d3.axisLeft(this.heatmapY));

        var myColor = d3.scaleLinear()
            .range(["white", "#69b3a2"])
            .domain([1, 100]);

        const plainHeatZones = this.data.map((interval, index) => Object.entries(interval)
            .filter(([propertyName]) => !isNaN(propertyName))
            .map(([zone, percentage]) => {
                const axis = this.timeAxis;
                return {index: axis[index], zone, percentage};
            }))
            .flat();

        this.heatmap.selectAll()
            .data(plainHeatZones, function (d) { return d.zone + ':' + d.index; })
            .enter()
            .append("rect")
            .attr("x", (function ({zone}) { return this.heatmapX(zone) }).bind(this))
            .attr("y", (function ({index}) { return this.heatmapY(index) }).bind(this))
            .attr("width", this.heatmapX.bandwidth())
            .attr("height", this.heatmapY.bandwidth())
            .style("fill", function ({percentage}) { return myColor(percentage) })
    };

    drawChart() {
        this.chart.selectAll("*").remove();

        this.chartX = d3.scaleBand()
            .range([0, this.widthChart])
            .domain(this.timeAxis)
            .padding(0.9);
        this.chart.append("g")
            .attr("transform", "translate(0," + this.heightChart + ")")
            .call(d3.axisBottom(this.chartX))
            .selectAll("text")
            .attr("transform", "translate(12,40) rotate(90)");

        // Add Y axis
        this.chartY = d3.scaleLinear()
            .domain([0, 1000])
            .range([this.heightChart, 0]);
        this.chart.append("g")
            .call(d3.axisLeft(this.chartY));

        const withCorrectIndex = this.data.map((interval, index) => {
            return {...interval, index: this.timeAxis[index]};
        });

        // Show confidence interval
        this.chart.append("path")
            .datum(withCorrectIndex)
            .attr("fill", "#cce5df")
            .attr("stroke", "none")
            .attr("d", d3.area()
                .x((function ({index}) { return this.chartX(index) }).bind(this))
                .y0((function ({estimatedMaxElevation}) { return this.chartY(estimatedMaxElevation) }).bind(this))
                .y1((function ({estimatedMinElevation}) { return this.chartY(estimatedMinElevation) }).bind(this))
            );

        // Add the line
        this.chart
            .append("path")
            .datum(withCorrectIndex)
            .attr("fill", "none")
            .attr("stroke", "steelblue")
            .attr("stroke-width", 1.5)
            .attr("d", d3.line()
                .x((function ({index}) { return this.chartX(index) }).bind(this))
                .y((function ({averageElevation}) { return this.chartY(averageElevation) }).bind(this))
            );
    };
}



(async () => {
    const response = await fetch("DATAS/combined.json");
    const graphData = await response.json();

    const generator = new GraphGenerator(graphData);
    /*generator.drawChart();
    generator.drawHeatmap();*/
    generator.startLoop(1);
})();