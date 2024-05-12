CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(80) NOT NULL,
  email VARCHAR(50) NOT NULL,
  telefone VARCHAR(18) NOT NULL,
  genero VARCHAR(20) NOT NULL,
  localizacao VARCHAR(100) NOT NULL,
  representante BOOLEAN NOT NULL,
  senha VARCHAR(30) NOT NULL
);
	
CREATE TABLE organizacoes (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  biografia TEXT NOT NULL,
  areas_atuacao VARCHAR(100) NOT NULL,
  localizacao VARCHAR(100) NOT NULL,
  link TEXT NOT NULL,
  id_usuarios INTEGER REFERENCES usuarios(id)
);
		
CREATE TABLE voluntarios (
  id SERIAL PRIMARY KEY,
  areas_interesse VARCHAR(100) NOT NULL,
  biografia TEXT NOT NULL,
  portfolio_externo TEXT NOT NULL,
  id_usuarios INTEGER REFERENCES usuarios(id)
);
		
CREATE TABLE publicacoes (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  tags VARCHAR(100) NOT NULL,
  conteudo TEXT NOT NULL,
  anexos TEXT NOT NULL,
  data_publicacao DATE NOT NULL,
  id_usuarios INTEGER REFERENCES usuarios(id),
  id_organizacoes INTEGER REFERENCES organizacoes(id)

);

CREATE TABLE atividades (
  id_voluntarios INTEGER REFERENCES voluntarios(id),
  id_organizacoes INTEGER REFERENCES organizacoes(id)
);