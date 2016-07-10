module DateHelper
  def format_date_month_year(date, format = '%d/%m/%Y')
    return "" if date.blank?
    
    date.strftime(format).to_s
  end
end