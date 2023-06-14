# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.8
pin "polaris-view-components", to: "polaris_view_components.js"
pin "highcharts" # @11.0.1
pin "highcharts/modules/annotations", to: "highcharts--modules--annotations.js" # @11.0.1
pin "canvas-confetti" # @1.6.0
