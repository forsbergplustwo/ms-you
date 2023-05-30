module SymptomsHelper

  def severity_options
    Measurement::SEVERITIES_MAPPING.keys.collect { |severity| [severity_name(severity), severity] }
  end

  def severity_name(severity)
    case severity
    when 0
      'None'
    when 1
      'Mild'
    when 2
      'Moderate'
    when 3
      'Severe'
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
    when 3
      :critical
    end
  end
end
