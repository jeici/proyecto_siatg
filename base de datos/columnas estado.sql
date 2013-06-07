

ALTER TABLE usuario ADD COLUMN estado_u boolean DEFAULT true;
ALTER TABLE dba ADD COLUMN estado_u boolean DEFAULT true;
ALTER TABLE administrador ADD COLUMN estado_u boolean DEFAULT true;
ALTER TABLE login ADD COLUMN estado_login boolean DEFAULT true;