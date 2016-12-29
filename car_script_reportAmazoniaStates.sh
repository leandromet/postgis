
#!/bin/sh


		ogr2ogr -f "ESRI Shapefile" -update -append  amazonia_imoveis_MT.shp PG:"host=host.116 user=user dbname=db"  -sql "SELECT    imovel.idt_imovel, imovel.cod_imovel, imovel.cod_protocolo, imovel.dat_protocolo, imovel.ind_status_imovel, imovel.ind_tipo_imovel, imovel.cod_cpf_cadastrante, imovel.nom_completo_cadastrante, imovel.nom_imovel, imovel.num_fracao_ideal, imovel.dat_criacao, imovel.dat_atualizacao,  imovel.cod_cep, imovel.des_acesso, imovel.cpf_responsavel,    imovel.num_area_imovel as area_imovel,   imovel.num_modulo_fiscal as num_mf, municipio.idt_municipio,    municipio.nom_municipio,    municipio.cod_estado,    rel_tema_imovel_poligono.the_geom as geom FROM    usr_geocar_aplicacao.imovel,    usr_geocar_aplicacao.municipio,    usr_geocar_aplicacao.rel_tema_imovel_poligono,    usr_geocar_aplicacao.tema WHERE    municipio.cod_estado = 'MT'   AND tema.idt_tema = 26 AND   municipio.idt_municipio = imovel.idt_municipio AND   rel_tema_imovel_poligono.idt_imovel = imovel.idt_imovel AND   tema.idt_tema = rel_tema_imovel_poligono.idt_tema " 


	ogr2ogr -f "CSV"  amazonia_imoveis_nomes_documento.csv PG:"host=host.144 user=user dbname=db"  -sql "SELECT  municipio.cod_estado,  imovel_pessoa.idt_imovel,  imovel_pessoa.ind_tipo_pessoa,  imovel_pessoa.cod_cpf_cnpj,  imovel_pessoa.nom_completo,  imovel.ind_status_imovel,  imovel.ind_tipo_imovel,  documento_imovel.idt_documento_imovel,  tipo_documento.cod_tipo_documento FROM  usr_geocar_aplicacao.imovel,  usr_geocar_aplicacao.municipio,  usr_geocar_aplicacao.imovel_pessoa,  usr_geocar_aplicacao.tipo_documento,  usr_geocar_aplicacao.documento_imovel WHERE  municipio.idt_municipio = imovel.idt_municipio AND imovel_pessoa.idt_imovel = imovel.idt_imovel AND tipo_documento.idt_tipo_documento = documento_imovel.ind_tipo_documento AND documento_imovel.idt_imovel = imovel.idt_imovel AND municipio.cod_estado IN ('AC','AM','RO','RR','PA','TO','MA','AP','MT') order by municipio.cod_estado, cod_tipo_documento"