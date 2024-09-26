init.sql
CREATE TABLE tbl_formularios (
    tp_form VARCHAR PRIMARY KEY,
    label_form TEXT,
    grupo VARCHAR
);

CREATE TABLE forms (
    uuid_form TEXT UNIQUE NOT NULL PRIMARY KEY,
    id_form VARCHAR UNIQUE NOT NULL,
    tp_form VARCHAR,
    CONSTRAINT fk_tp_form
        FOREIGN KEY (tp_form)
        REFERENCES tbl_formularios(tp_form)
);

CREATE TABLE forms_prefeitura (
    id_relatorio VARCHAR PRIMARY KEY,
    uuid_form TEXT,
    data_fiscalizacao DATE,
    hora_fim TIMESTAMP,
    CONSTRAINT fk_uuid_form
        FOREIGN KEY (uuid_form)
        REFERENCES forms(uuid_form)
);

CREATE TABLE prefeituras_identificacao (
    id_prefeituras SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR,
    razao_social TEXT,
    cnpj VARCHAR,
    logradouro TEXT,
    bairro TEXT,
    cidade TEXT,
    email TEXT,
    telefone TEXT,
    cep INT,
    CONSTRAINT fk_forms_prefeitura_identificacao
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
);

CREATE TABLE tbl_prefeituras_servicos (
    id_prefeitura_servico INT PRIMARY KEY,
    label TEXT
);

CREATE TABLE prefeituras_servicos (
    id_servico SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR,
    id_prefeitura_servico INT,
    CONSTRAINT fk_tbl_prefeituras_servicos
        FOREIGN KEY (id_prefeitura_servico)
        REFERENCES tbl_prefeituras_servicos(id_prefeitura_servico),
    CONSTRAINT fk_relatorio_servicos
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
);

CREATE TABLE prefeituras_responsaveis (
    id_responsavel SERIAL PRIMARY KEY,
    id_relatorio VARCHAR,
    nome TEXT,
    documento TEXT,
    email TEXT,
    CONSTRAINT fk_forms_prefeitura_responsaveis
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
);

CREATE TABLE prefeituras_rhs (
    id_rh SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR,
    rh_nome TEXT,
    rh_formacao VARCHAR,
    rh_registro INT,
    rh_uf VARCHAR,
    rh_servico TEXT,
    rh_rt BOOL,
    CONSTRAINT fk_forms_prefeitura_rhs
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
);

CREATE TABLE prefeituras_pcps (
    id_pcp SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR, 
    pcp_possui_art BOOL,
    pcp_art_codigo VARCHAR,
    pcp_formato VARCHAR,
    pcp_tipo VARCHAR,
    CONSTRAINT fk_forms_prefeitura_pcps
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
);

CREATE TABLE prefeituras_clinhvs (
    id_clinhv SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR,
    clinhv_art BOOL,
    clinhv_art_registro VARCHAR,
    clinhv_registro BOOL,
    clinhv_registro_codigo VARCHAR,
    CONSTRAINT fk_forms_prefeitura_clinhvs
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
);

CREATE TABLE prefeituras_cczs (
    id_ccz SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR,
    cczs_art BOOL,
    cczs_art_codigo VARCHAR,
    ccz_eutanasia BOOL,
    ccz_abrigo BOOL,
    ccz_exame TEXT,
    CONSTRAINT fk_forms_prefeitura_cczs
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
);

CREATE TABLE prefeituras_abatedouros (
    id_abatedouro SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR,
    abatedouro_art BOOL,
    abatedouro_art_registro VARCHAR,
    abatedouro_registro BOOL,
    abatedouro_registro_codigo VARCHAR,
    abatedouro_svo VARCHAR,
    CONSTRAINT fk_forms_prefeitura_abatedouros
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
); 

CREATE TABLE tbl_registros_sof (
    tipo_sof VARCHAR PRIMARY KEY NOT NULL,
    label_tipo_sof TEXT
);

CREATE TABLE prefeituras_abatedouros_animais (
    id_animal SERIAL PRIMARY KEY NOT NULL,
    id_abatedouro INT,
    cat_animal INT,
    CONSTRAINT fk_prefeituras_abatedouros_animais
        FOREIGN KEY (id_abatedouro)
        REFERENCES prefeituras_abatedouros(id_abatedouro)
); 

CREATE TABLE prefeituras_visas (
    id_visa SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR,
    visa_alvara BOOL,
    visa_medicamentos BOOL,
    visa_pgrss BOOL,
    CONSTRAINT fk_forms_prefeitura_visas
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
); 	

CREATE TABLE prefeituras_manejo_fauna (
    id_silvestre SERIAL PRIMARY KEY NOT NULL,
    id_relatorio VARCHAR,
    silvestre_tipo VARCHAR,
    silvestre_tipo_outro TEXT,
    silvestre_art BOOL,
    silvestre_art_registro VARCHAR,
    silvestre_registro BOOL,
    silvestre_registro_codigo VARCHAR,
    CONSTRAINT fk_forms_prefeitura_manejo_fauna
        FOREIGN KEY (id_relatorio)
        REFERENCES forms_prefeitura(id_relatorio)
);
