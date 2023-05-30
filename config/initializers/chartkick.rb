Chartkick.options = {
  colors: ["#5912D5", "#3063E1"],
  library: {
    chart: {
      zoomType: 'x',
    },
    plotOptions: {
      series: {
        fillOpacity: 0.2,
        lineWidth: 3,
        marker: {
          radius: 4,
          enabled: true
        },
        animation: {
          defer: 200,
          duration: 1000,
          easing: "easeInOut"
        }
      }
    },
    legend: {
      enabled: true
    },
    xAxis: {
      gridLineColor: "#EEEEEF",
      labels: {
        style: {
          color: "#70707A",
          fontSize: "12px"
        }
      }
    },
    yAxis: {
      gridLineColor: "#EEEEEF",
      allowDecimals: false,
      labels: {
        style: {
          color: "#70707A",
          fontSize: "12px"
        }
      }
    }
  }
}
