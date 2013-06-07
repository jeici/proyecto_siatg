-- DROP FUNCTION prm_persona(text, text, text, text, text, text, text, text, text, text, text, text, text, text, text, integer, text, text, integer, text, text, text, text);

CREATE OR REPLACE FUNCTION prc_docente(text, integer, integer, text, text, text,text,text, boolean,integer)
  RETURNS text AS
$BODY$
DECLARE
carne  ALIAS FOR $1;
id_car ALIAS FOR $2;
id_tel  ALIAS FOR $3;
nombre ALIAS FOR $4;
apellido ALIAS FOR $5;
direccion  ALIAS FOR $6;
correo ALIAS FOR $7;
titulo_p ALIAS FOR $8;
estado ALIAS FOR $9;
opcion ALIAS FOR $10;


msj text;

BEGIN
--insertar valores en tabla persona
INSERT INTO docente(carnet,id_carrera, id_telefono, nombres_p, apellidos_p, direccion_p, correo_p,titulo,estado_persona)
VALUES (carne, id_car, id_tel, nombre, apellido, direccion, correo,titulo_p,estado);
msj:= 'docente creado con exito';
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
msj:='ya existe el docente';
RETURN msj;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
