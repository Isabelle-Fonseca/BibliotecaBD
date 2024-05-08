/*Criando tabela usuarios*/
CREATE TABLE Usuarios (
idUsuario INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
senha CHAR(8) NOT NULL,
cpf CHAR(11) NOT NULL,
email VARCHAR(30) NOT NULL,
genero CHAR(1) DEFAULT 'N',
tipoLogradouro VARCHAR(10) NOT NULL,
nomeLogradouro VARCHAR(30) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(10) DEFAULT 'não existe',
cep CHAR(8) NOT NULL,
cidade VARCHAR(30) NOT NULL,
estado CHAR(2) NOT NULL,
bairro VARCHAR(20) NOT NULL,
CONSTRAINT PRIMARY KEY (idUsuario),
CONSTRAINT CK_TipoLogradouro CHECK (tipoLogradouro='Praça' OR tipoLogradouro='Rua' OR tipoLogradouro='Avenida' OR tipoLogradouro='Rodovia' OR tipoLogradouro='Viela'),
CONSTRAINT CK_genero CHECK (genero='F' OR genero='M' OR genero='N')
);

/*Criando tabela ContatoTelefone*/
CREATE TABLE contatoTelefone (
idContatoTelefone INT AUTO_INCREMENT NOT NULL,
ddi VARCHAR(5) NOT NULL,
ddd CHAR(2) NOT NULL,
numero CHAR(9) NOT NULL,
idUsuario INT NOT NULL,
CONSTRAINT PRIMARY KEY (idContatoTelefone),
CONSTRAINT FK_contatoTelefone_Usuarios FOREIGN KEY (idUsuario)
REFERENCES Usuarios(idUsuario)
);


/*Criando tabela Aluno*/
CREATE TABLE Alunos (
matricula VARCHAR(10) NOT NULL,
nivelPontualidade TINYINT(1),
idUsuario INT NOT NULL,
CONSTRAINT FK_Alunos_Usuarios FOREIGN KEY (idUsuario)
REFERENCES Usuarios(idUsuario)
);

/*Criando tabela Recepcionista*/
CREATE TABLE Recepcionistas (
idUsuario INT NOT NULL,
CTPS VARCHAR(30),
CONSTRAINT FK_Recepcionistas_Usuarios FOREIGN KEY (idUsuario)
REFERENCES Usuarios(idUsuario)
);

/*Criando tabela Professores*/
CREATE TABLE Professores (
idUsuario INT NOT NULL,
areaAtuacao VARCHAR(10) NOT NULL,
salario DECIMAL(7,2) NOT NULL,
CONSTRAINT FK_Professores_Usuarios FOREIGN KEY (idUsuario)
REFERENCES Usuarios(idUsuario)
);

/*Criando tabela Emprestimo*/
CREATE TABLE Emprestimos (
idEmprestimo INT auto_increment NOT NULL,
dataEmprestimo DATETIME NOT NULL,
multa DECIMAL(6,2),
dataDevolucaoEfetiva DATETIME,
dataDevolucao DATETIME NOT NULL,
idUsuario INT NOT NULL,
CONSTRAINT PRIMARY KEY (idEmprestimo),
CONSTRAINT FK_Emprestimos_Usuarios FOREIGN KEY (idUsuario)
REFERENCES Usuarios(idUsuario)
);
DROP TABLE Emprestimos 
DROP TABLE itemEmprestimo 
/*Criando tabela Editoras*/
CREATE TABLE Editoras (
idEditora INT auto_increment NOT NULL,
nome VARCHAR(30) NOT NULL,
celular VARCHAR(14) NOT NULL,
email VARCHAR(50) NOT NULL,
responsavel VARCHAR(50) NOT NULL,
isbn CHAR(10),
CONSTRAINT PRIMARY KEY (idEditora)
);

/*Criando tabela Livro*/
CREATE TABLE Livros (
idLivro INT auto_increment NOT NULL,
nome VARCHAR(100) NOT NULL,
tomo VARCHAR(10) NOT NULL,
genero VARCHAR(15) NOT NULL,
qtdPaginas INT,
idioma VARCHAR(20) NOT NULL,
ano INT,
edicao INT,
ISBN CHAR(13),
idEditora INT NOT NULL,
CONSTRAINT PRIMARY KEY (idLivro),
CONSTRAINT FK_Livros_Editoras FOREIGN KEY(idEditora)
REFERENCES Editoras(idEditora)
);

DROP TABLE Livros

/*Criando tabela ItemEmprestimo*/
CREATE TABLE ItemEmprestimo (
idEmprestimo INT NOT NULL,
idLivro INT NOT NULL,
CONSTRAINT PRIMARY KEY (idEmprestimo,idLivro),
CONSTRAINT FK_ItemEmprestimo_Emprestimos FOREIGN KEY (idEmprestimo)
REFERENCES Emprestimos(idEmprestimo),
CONSTRAINT FK_ItemEmprestimo_Livros FOREIGN KEY (idLivro)
REFERENCES Livros(idLivro)
);

DROP TABLE ItemEmprestimo 

/*Criando tabela Autores*/
CREATE TABLE Autores (
idAutor INT AUTO_INCREMENT NOT NULL,
nome VARCHAR(50) NOT NULL,
nacionalidade VARCHAR(30) NOT NULL,
CONSTRAINT PRIMARY KEY (idAutor)
);

/*Criando tabela LivrosAutores*/
CREATE TABLE LivrosAutores (
idLivro INT NOT NULL,
idAutor INT NOT NULL,
CONSTRAINT PRIMARY KEY (idLivro,idAutor),
CONSTRAINT FK_LivrosAutores_Livros FOREIGN KEY (idLivro) REFERENCES Livros(idLivro),
CONSTRAINT FK_LivroAutores_Autores FOREIGN KEY (idAutor) REFERENCES Autores(idAutor)
);
DROP TABLE livrosautores

