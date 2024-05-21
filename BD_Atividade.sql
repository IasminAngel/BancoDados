CREATE SCHEMA BDBIBLIOTECA;

USE BDBIBLIOTECA;

CREATE TABLE Usuario (
    idUsuario NUMERIC PRIMARY KEY,
    nomeUsuario VARCHAR(30),
    email VARCHAR(40),
    logradouro VARCHAR(30),
    numero NUMERIC,
    CEP VARCHAR(10),
    cidade VARCHAR(20),
    estado VARCHAR(2)
);

CREATE TABLE TelUsuario (
    idTelUsuario NUMERIC PRIMARY KEY,
    fk_Usuario_idUsuario NUMERIC,
    telefoneUsuario VARCHAR(12)
);

CREATE TABLE Categoria (
    idCategoria NUMERIC PRIMARY KEY,
    nomeCategoria VARCHAR(30)
);

CREATE TABLE Autor (
    idAutor NUMERIC PRIMARY KEY,
    nomeAutor VARCHAR(30)
);

CREATE TABLE Livro (
    ISBN VARCHAR(15) PRIMARY KEY,
    tituloLivro VARCHAR(30),
    anoPublicacao NUMERIC,
    quantExemplares NUMERIC,
    fk_Categoria_idCategoria NUMERIC
);

CREATE TABLE Autor_Livro (
    fk_Livro_ISBN VARCHAR(15),
    fk_Autor_idAutor NUMERIC,
    PRIMARY KEY(fk_Livro_ISBN,fk_Autor_idAutor)
);

CREATE TABLE Emprestimo (
    idEmprestimo NUMERIC PRIMARY KEY,
    fk_Usuario_idUsuario NUMERIC,
    dataEmprestimo DATE,
    dataDevolucaoPrevista DATE,
    dataDevolucaoRealizada DATE
);

CREATE TABLE Emprestimo_Livro(
	 fk_Emprestimo_idEmprestimo NUMERIC,
     fk_Livro_ISBN VARCHAR(15),
     PRIMARY KEY (fk_Emprestimo_idEmprestimo, fk_Livro_ISBN)
);


ALTER TABLE TelUsuario ADD CONSTRAINT FK_TelUsuario_2
    FOREIGN KEY (fk_Usuario_idUsuario)
    REFERENCES Usuario (idUsuario)
    ON DELETE RESTRICT;
 
 
ALTER TABLE Livro ADD CONSTRAINT FK_Livro_2
    FOREIGN KEY (fk_Categoria_idCategoria)
    REFERENCES Categoria (idCategoria)
    ON DELETE RESTRICT;
 
 
ALTER TABLE Emprestimo ADD CONSTRAINT FK_Emprestimo_2
    FOREIGN KEY (fk_Usuario_idUsuario)
    REFERENCES Usuario (idUsuario);
 
 
ALTER TABLE Emprestimo_Livro ADD CONSTRAINT FK_Emprestimo_Livro_2
    FOREIGN KEY (fk_Emprestimo_idEmprestimo)
    REFERENCES Emprestimo (idEmprestimo);
    

ALTER TABLE Emprestimo_Livro ADD CONSTRAINT FK_Emprestimo_Livro_3
    FOREIGN KEY (fk_Livro_ISBN)
    REFERENCES Livro (ISBN);
 
ALTER TABLE Autor_Livro ADD CONSTRAINT FK_Autor_Livro_2
    FOREIGN KEY (fk_Autor_idAutor)
    REFERENCES Autor (idAutor);
 
ALTER TABLE Autor_Livro ADD CONSTRAINT FK_Autor_Livro_3
    FOREIGN KEY (fk_Livro_ISBN)
    REFERENCES Livro (ISBN);
    
    -- ----------------------------------------------------------
INSERT INTO usuario (idUsuario, nomeUsuario, email, logradouro, numero, CEP, cidade, estado)
VALUES (1, "Ana", "ana@gmail.com", "Av Dendezeiros", 99,40456789,"Salvador","BA");

INSERT INTO usuario (idUsuario, nomeUsuario, email, logradouro, numero, CEP, cidade, estado)
VALUES (2, "Bruno", "bruno@gmail.com", "Av Beira Mar", 55,40963741,"Salvador","BA");

INSERT INTO usuario (idUsuario, nomeUsuario, email, logradouro, numero, CEP, cidade, estado)
VALUES (3, "Carlos", "carlos@gmail.com", "Rua da Paciencia", 45,40588123,"Salvador","BA");

INSERT INTO usuario (idUsuario, nomeUsuario, email, logradouro, numero, CEP, cidade, estado)
VALUES (4, "Danilo", "danilo@gmail.com", "Rua do Jardins", 33,40852417,"Salvador","BA");

INSERT INTO usuario (idUsuario, nomeUsuario, email, logradouro, numero, CEP, cidade, estado)
VALUES (5, "Eduardo", "eduardo@gmail.com", "Av Porto dos Mastros", 11,40255110,"Salvador","BA");


INSERT INTO autor (idAutor, nomeAutor) VALUES (1, "João");
INSERT INTO autor (idAutor, nomeAutor) VALUES (2, "Maria");
INSERT INTO autor (idAutor, nomeAutor) VALUES (3, "José");

INSERT INTO categoria (idCategoria, nomeCategoria) VALUES (1, "Romance");
INSERT INTO categoria (idCategoria, nomeCategoria) VALUES (2, "Drama");
INSERT INTO categoria (idCategoria, nomeCategoria) VALUES (3, "Técnico");

INSERT INTO livro (ISBN, tituloLivro, anoPublicacao, fk_Categoria_idCategoria,quantExemplares)
VALUES ("111","Que rei sou eu", 1999,2,3);
INSERT INTO autor_livro (fk_Livro_ISBN,fk_Autor_idAutor) VALUES ("111",1);

INSERT INTO livro (ISBN, tituloLivro, anoPublicacao, fk_Categoria_idCategoria,quantExemplares)
VALUES ("222","Elas por Elas", 2001,1,5);
INSERT INTO autor_livro (fk_Livro_ISBN,fk_Autor_idAutor) VALUES ("222",1);
INSERT INTO autor_livro (fk_Livro_ISBN,fk_Autor_idAutor) VALUES ("222",2);

INSERT INTO livro (ISBN, tituloLivro, anoPublicacao, fk_Categoria_idCategoria,quantExemplares)
VALUES ("333","C completo e total", 1995,3,2);
INSERT INTO autor_livro (fk_Livro_ISBN,fk_Autor_idAutor) VALUES ("333",3);

INSERT INTO livro (ISBN, tituloLivro, anoPublicacao, fk_Categoria_idCategoria,quantExemplares)
VALUES ("444","Java em 21 dias", 2005,3,1);
INSERT INTO autor_livro (fk_Livro_ISBN,fk_Autor_idAutor) VALUES ("444",3);

INSERT INTO livro (ISBN, tituloLivro, anoPublicacao, fk_Categoria_idCategoria,quantExemplares)
VALUES ("555","Romeu e Julieta", 1985,2,9);
INSERT INTO autor_livro (fk_Livro_ISBN,fk_Autor_idAutor) VALUES ("555",2);

INSERT INTO emprestimo (idEmprestimo,fk_Usuario_idUsuario,dataEmprestimo,dataDevolucaoPrevista)
VALUES (1, 1, "2023-07-04", "2023-07-25");
INSERT INTO emprestimo_livro (fk_Emprestimo_idEmprestimo,fk_Livro_ISBN)
VALUES (1,"111");
INSERT INTO emprestimo_livro (fk_Emprestimo_idEmprestimo,fk_Livro_ISBN)
VALUES (1,"222");


INSERT INTO emprestimo (idEmprestimo,fk_Usuario_idUsuario,dataEmprestimo,dataDevolucaoPrevista)
VALUES (2, 4, "2023-07-03", "2023-07-20");
INSERT INTO emprestimo_livro (fk_Emprestimo_idEmprestimo,fk_Livro_ISBN)
VALUES (2,"111");
INSERT INTO emprestimo_livro (fk_Emprestimo_idEmprestimo,fk_Livro_ISBN)
VALUES (2,"333");


INSERT INTO emprestimo (idEmprestimo,fk_Usuario_idUsuario,dataEmprestimo,dataDevolucaoPrevista)
VALUES (3, 3, "2023-07-05", "2023-07-15");
INSERT INTO emprestimo_livro (fk_Emprestimo_idEmprestimo,fk_Livro_ISBN)
VALUES (3,"555");

-- -------------------------------------------------------------
/* VIEW: Seleção dos livros com seus respecƟvos autores */
CREATE VIEW LIVRO_AUTOR AS
	SELECT L.tituloLivro, A.nomeAutor 
    FROM livro L, autor A, autor_livro AL
	WHERE (AL.fk_Livro_ISBN = L.ISBN) and (AL.fk_Autor_idAutor = A.idAutor);
    
/* ou */
    
CREATE VIEW LIVRO_AUTOR AS
	SELECT L.tituloLivro, A.nomeAutor 
    FROM autor_livro AL
    INNER JOIN livro L ON  AL.fk_Livro_ISBN = L.ISBN
    INNER JOIN autor A ON AL.fk_Autor_idAutor = A.idAutor;
    
/* STORED PROCEDURE: Selação dos livros de uma determinada categoria */
CREATE PROCEDURE Verificar_Quantidade_livros_categoria (IN categoria INT)
	SELECT ISBN, tituloLivro, anoPublicacao, quantExemplares  FROM livro WHERE fk_Categoria_idCategoria = categoria;

CALL Verificar_Quantidade_livros_categoria(3);

/* STORED PROCEDURE: Selação da quantidade de exemplares dos livros de uma determinada categoria */
CREATE PROCEDURE Verificar_Quantidade_Exemplares_categoria (IN categoria INT)
	SELECT SUM(quantExemplares)  FROM livro 
    GROUP BY fk_Categoria_idCategoria
    HAVING fk_Categoria_idCategoria = categoria;
    
CALL Verificar_Quantidade_Exemplares_categoria(3);
    
/* STORED PROCEDURE: Selação da quantidade de livros de uma determinada categoria - retornando essa quantidade atráves do parametro "quantidade" */
CREATE PROCEDURE Verificar_Quantidade_livros (OUT quantidade INT)
	SELECT COUNT(*) INTO quantidade FROM livro;
    
CALL Verificar_Quantidade_livros(@quant);
SELECT @quant;

/* FUNCTION: retorna a quantidade de livros de uma determinada categoria */
DELIMITER $
CREATE FUNCTION Ver_Quantidade_livros(categoria INT) 
RETURNS int
READS SQL DATA
BEGIN
	return (SELECT COUNT(*) FROM livro WHERE fk_Categoria_idCategoria = categoria);
END$
DELIMITER ;

SELECT Ver_Quantidade_livros(3);

/* TRIGGER */

DELIMITER $
CREATE TRIGGER TGR_EMPRESTIMO_BI AFTER INSERT
ON emprestimo_livro
FOR EACH ROW
BEGIN
	UPDATE livro SET quantExemplares = quantExemplares - 1
	WHERE ISBN = NEW.fk_Livro_ISBN;
END$

DELIMITER ;