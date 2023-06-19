module SymptomsHelper
  def severity_select_options
    Measurement::SEVERITIES_MAPPING.keys.collect { |severity| [severity_name(severity), severity] }
  end

  def severity_name(severity)
    case severity
    when 0
      it("None")
    when 1
      it("Mild")
    when 2
      it("Moderate")
    when 3
      it("Severe")
    when 4
      it("Critical")
    end
  end

  def severity_badge_status(severity)
    case severity
    when 0
      :success
    when 1
      :attention
    when 2
      :warning
    else
      :critical
    end
  end

  def chart_data_formatter(name: "Chart", data: [])
    [{
      name: it(name),
      data: data,
      marker: {symbol: "circle"}
    }]
  end
end
