module SymptomsHelper

  def severity_select_options
    Measurement::SEVERITIES_MAPPING.keys.collect { |severity| [severity_name(severity), severity] }
  end

  def severity_name(severity)
    case severity
    when 0
      it('None')
    when 1
      it('Mild')
    when 2
      it('Moderate')
    when 3
      it('Severe')
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
