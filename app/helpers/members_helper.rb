module MembersHelper
  def turno_id_is_int(turno_id)
    turno_id_class = turno_id.class
    turno_id_class == Integer
  end
end
