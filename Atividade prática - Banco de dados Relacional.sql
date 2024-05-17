-- criar um database novo
CREATE DATABASE db_generation_game_online;

-- Usa o database
USE db_generation_game_online;

-- CRIAR A TABELA DE CLASSES
CREATE TABLE tb_classes(
    id BIGINT AUTO_INCREMENT,
    raca VARCHAR(255) NOT NULL,
    habilidade VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- CRIAR A TABELA DE PERSONAGENS
CREATE TABLE tb_personagens(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    ataque DECIMAL(6,2) NOT NULL,
    defesa DECIMAL(6,2) NOT NULL,
    genero VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE tb_personagens ADD tb_classes_id BIGINT;

ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes
FOREIGN KEY (tb_classes_id) REFERENCES tb_classes (id);

-- Dados da Tabela de classes
INSERT INTO tb_classes (raca, habilidade)
VALUES ("Elfo","Mago"),
("Demonio","Bruxo"),
("Humano","Mago"),
("Anão","Ferreiro"),
("Elfo Selvagem","Curandeiro");

-- Dados da Tabela Personagens
INSERT INTO tb_personagens (nome, ataque, defesa, genero, tb_classes_id)
VALUES ("Naysha", 3000, 2000, "feminino",1),
("Amplisa", 2500, 1000, "feminino",3),
("Echidna", 1500, 3000, "feminino",2),
("Sylas", 4500, 1000, "masculino",3),
("Furion", 1500, 2000, "masculino",5),
("Azena", 3000, 3000, "feminino",1),
("Balthor", 1000, 2000, "masculino",4),
("kazeros", 4000, 4000, "masculino",2);

SET SQL_SAFE_UPDATES = 0;

UPDATE tb_personagens SET defesa = 1500 WHERE defesa = 1000;

SELECT * FROM tb_personagens WHERE ataque > 2000; -- Poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE defesa < 2000 AND defesa > 1000; -- Poder de defesa esteja no intervalo 1000 e 2000.

SELECT * FROM tb_personagens WHERE nome LIKE "%c%"; -- Faça um SELECT utilizando o operador LIKE, buscando todes os 
-- personagens que possuam a letra C no atributo nome.

SELECT nome, ataque, defesa, genero, tb_classes.raca, tb_classes.habilidade
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.tb_classes_id = tb_classes.id;
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.

SELECT nome, ataque, defesa, genero, tb_classes.raca, tb_classes.habilidade
FROM tb_personagens
INNER JOIN tb_classes ON tb_personagens.tb_classes_id = tb_classes.id
WHERE tb_classes.id = 2;
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica

SELECT *FROM tb_personagens;
SELECT *FROM tb_classes;
