
class Appointment

  attr_reader :location, :purpose, :hour, :min

  def initialize(location, purpose, hour, min)
    @location = location
    @purpose = purpose
    @hour = hour
    @min = min     
  end

end

class MonthlyAppointment < Appointment
  attr_reader :day

  def initialize(location, purpose,hour, min, day)
    super(location, purpose, hour, min)
    @day = day 
  end

  def occurs_on?(dias)
    dias == self.day
    
  end

  def to_s
    "Reunion mensual en #{self.location} sobre #{self.purpose} el dia #{self.day} a la(s) #{self.hour}:#{self.min} "
  end
end

class DailyAppointment < Appointment
  
  def occurs_on?(horas, minutos)
    if horas == self.hour && minutos == self.min
      true
    else
      false
    end
  end

  def to_s
    "Reunion diaria en #{self.location} sobre #{self.purpose} a las #{self.hour}:#{self.min} "
  end
end



class OneTimeAppointment < Appointment
  attr_reader :day, :month, :year

  def initialize ( location, purpose, hour, min, day, month, year)
    super( location, purpose, hour, min)
    @day = day
    @month = month
    @year = year   
  end

  def occurs_on?(dias, mes, ano)
    if dias == self.day && mes == self.month && ano==self.year
      true
    else
      false
    end
  end

  def to_s
    "Reunion unica en #{self.location} sobre #{self.purpose} el #{self.day}/#{self.month}/#{self.year} a la(s) #{self.hour}:#{self.min} "
  end
end


puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
