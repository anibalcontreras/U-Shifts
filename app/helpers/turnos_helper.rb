module TurnosHelper
  def limite_personas_is_int(limite_personas)
    limite_personas_class = limite_personas.class
    limite_personas_class == Integer
  end
end
