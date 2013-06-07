-- DROP FUNCTION prm_persona(text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, integer, text, text, integer, text, text, text, text);

CREATE OR REPLACE FUNCTION prc_persona(text, text, text, text, text, text, text,integer)
  RETURNS text AS
$BODY$
DECLARE
carne  ALIAS FOR $1;
id_car ALIAS FOR $2;
id_tel  ALIAS FOR $3;
nombre ALIAS FOR $4;
apellido ALIAS FOR $5;
direccion  ALIAS FOR $6;
correo FOR $7;
estado FOR $8;
opcion FOR $9;


msj text;

BEGIN
--insertar valores en tabla persona
INSERT INTO persona(id_carrera, id_telefono, nombres_p, apellidos_p, direccion_p, correo_p)
VALUES (carne, id_car, id_tel, nombre, apellido, direccion, correo_p, estado_persona, opcion );
msj:= 'persona creado con exito';
--evaluar tipo de usuario a ingresar
/*if (tipo_usuario=1) then
	msj:=prm_bibliotecario(documento,turno,cargo);
end if;
if (tipo_usuario=2)then
	msj:=prm_admin_bibliotecario(documento,turno,cargo);
end if;

if (tipo_usuario=3)then
	msj:=prm_miembro(documento,carrera,grad_acad,area,institucion,tipo_miembro);
end if;*/

RETURN msj;
EXCEPTION WHEN unique_violation THEN
msj:='ya existe la persona';
RETURN msj;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
