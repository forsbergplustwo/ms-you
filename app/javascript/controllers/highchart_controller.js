import { Controller } from "@hotwired/stimulus"
import Highcharts from 'highcharts';
import AnnotationsModule from 'highcharts/modules/annotations';
AnnotationsModule(Highcharts);

export default class extends Controller {
  static values = {
    seriesData: Array,
    annotationsLabelData: {
      type: Array,
      default: []
    }
  }

  connect() {
    new Highcharts.Chart({
      "chart": {
        "height": 300,
        "zoomType": "x",
        "type": "area",
        "renderTo": this.element,
      },
      "xAxis": {
        "plotLines": this.plotLines(),
        "title": {
          "text": null
        },
        "labels": {
          "style": {
            "fontSize": "13px",
            "color": "#70707A"
          }
        },
        "gridLineColor": "#EEEEEF",
        "type": "datetime"
      },
      "yAxis": {
        "title": {
          "text": null
        },
        "labels": {
          "style": {
            "fontSize": "13px",
            "color": "#70707A"
          }
        },
        "min": 0,
        "gridLineColor": "#EEEEEF",
        "allowDecimals": false,
      },
      "title": {
        "text": null
      },
      "credits": {
        "enabled": false
      },
      "legend": {
        "borderWidth": 0,
        "enabled": true,
        "itemStyle": {
          "fontSize": "13px"
        }
      },
      "tooltip": {
        "style": {
          "fontSize": "13px"
        }
      },
      "plotOptions": {
        "areaspline": {
          "stacking": "normal"
        },
        "area": {
          "stacking": "normal",
          "step": "left"
        },
        "series": {
          "marker": {
            "enabled": true,
            "radius": 4
          },
          "fillOpacity": 0.2,
          "lineWidth": 3,
          "animation": {
            "defer": 200,
            "duration": 1000,
            "easing": "easeInOut"
          }
        }
      },
      "time": {
        "useUTC": false
      },
      "colors": [
        "#5912D5",
        "#3063E1"
      ],
      // "annotations": [{
      //   "labelOptions": {
      //     "style": {
      //       "fontSize": "12px",
      //     }
      //   },
      //   "labels": this.annotationsLabelDataValue
      // }],
      "series": this.seriesDataValue
    });
  }

  plotLines() {
    const lines = this.annotationsLabelDataValue.map((label) => {
      return {
        // Color grey as hex
        color: '#BABFC3',
        width: 2,
        value: label.x,
        label: {
          style: {
            fontSize: '12px',
          },
          verticalAlign: 'top',
          text: label.text.toString(),
        }
      }
    })
    console.log(lines)
    return lines
  }
}
