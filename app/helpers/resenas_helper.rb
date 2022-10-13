module ResenasHelper
  def first_letter(act_title)
    upper_title = act_title.capitalize
    (upper_title == act_title)
  end

  def valoracion_is_int(valoracion)
    valoracion_class = valoracion.class
    valoracion_class == Integer
  end
end
