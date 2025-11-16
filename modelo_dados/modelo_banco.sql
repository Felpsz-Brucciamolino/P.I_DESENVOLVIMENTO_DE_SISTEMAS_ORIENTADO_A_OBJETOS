CREATE TABLE Departamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(id)
);

CREATE TABLE PessoaFisica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    dt_nascimento DATE,
    endereco VARCHAR(200),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

CREATE TABLE PessoaJuridica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    inscricao VARCHAR(30),
    endereco VARCHAR(200),
    contatos VARCHAR(100)
);

CREATE TABLE Professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pessoa_fisica_id INT NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    titulacao VARCHAR(50),
    especialidade VARCHAR(50),
    vinculo VARCHAR(30),
    FOREIGN KEY (pessoa_fisica_id) REFERENCES PessoaFisica(id)
);

CREATE TABLE Aluno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pessoa_fisica_id INT NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    curso_id INT,
    turma VARCHAR(20),
    data_ingresso DATE,
    FOREIGN KEY (pessoa_fisica_id) REFERENCES PessoaFisica(id),
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);

CREATE TABLE Fornecedor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pessoa_juridica_id INT NOT NULL,
    dados_bancarios VARCHAR(100),
    FOREIGN KEY (pessoa_juridica_id) REFERENCES PessoaJuridica(id)
);

CREATE TABLE Matricula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    turma VARCHAR(20),
    data_ingresso DATE,
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);
