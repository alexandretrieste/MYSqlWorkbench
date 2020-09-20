#ALEXANDRE_MARTINS
SET GLOBAL lc_time_names=pt_BR;
CREATE DATABASE  IF NOT EXISTS `atividade5` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `atividade5`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    DatabASe: atividade5
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `atendente`
--

DROP TABLE IF EXISTS `atendente`;
/*!40101 SET @saved_cs_client     = @@CHARacter_SET_client */;
/*!50503 SET CHARacter_SET_client = utf8mb4 */;
CREATE TABLE `atendente` (
  `cod_atendente` INT(5) NOT NULL AUTO_INCREMENT,
  `nome` varCHAR(45) NOT NULL,
  `email` varCHAR(35) NOT NULL,
  PRIMARY KEY (`cod_atendente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET CHARacter_SET_client = @saved_cs_client */;

--
-- Dumping data for table `atendente`
--

LOCK TABLES `atendente` WRITE;
/*!40000 ALTER TABLE `atendente` DISABLE KEYS */;
INSERT INTO `atendente` VALUES (1,'atendente01','atendente01@hotmail.com'),(2,'atendente02','atendente02@hotmail.com'),(3,'atendente03','atendente03@hotmail.com'),(4,'atendente04','atendente04@hotmail.com'),(5,'atendente05','atendente05@hotmail.com');
/*!40000 ALTER TABLE `atendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@CHARacter_SET_client */;
/*!50503 SET CHARacter_SET_client = utf8mb4 */;
CREATE TABLE `curso` (
  `cod_curso` INT(5) NOT NULL AUTO_INCREMENT,
  `nome` varCHAR(50) NOT NULL,
  PRIMARY KEY (`cod_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET CHARacter_SET_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Informática'),(2,'Biotecnologia'),(3,'Agroecologia'),(4,'Eletrônica'),(5,'Automação');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@CHARacter_SET_client */;
/*!50503 SET CHARacter_SET_client = utf8mb4 */;
CREATE TABLE `dependente` (
  `cod_dependente` INT(10) NOT NULL,
  `nome` varCHAR(45) NOT NULL,
  `datanAScimento` date NOT NULL,
  `cod_usuario` INT(10) NOT NULL,
  PRIMARY KEY (`cod_dependente`),
  KEY `cod_usuario` (`cod_usuario`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET CHARacter_SET_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (1,'Sabrina Juliani','2000-10-10',1),(2,'Felipe Juliani','1998-10-10',1),(3,'Marcia Santos','1990-10-10',2),(4,'Paula Kruger','1999-11-10',3),(5,'Fred Kruger','1990-12-15',3),(6,'Olavo Kruger','1995-05-25',3),(7,'Julia Gonçalves','2015-05-21',5);
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@CHARacter_SET_client */;
/*!50503 SET CHARacter_SET_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `cod_emprestimo` INT(5) NOT NULL AUTO_INCREMENT,
  `cod_atendente` INT(5) NOT NULL,
  `cod_usuario` INT(5) NOT NULL,
  `hora` varCHAR(5) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`cod_emprestimo`),
  KEY `cod_usuario` (`cod_usuario`),
  KEY `cod_atendente` (`cod_atendente`),
  CONSTRAINT `cod_atendente` FOREIGN KEY (`cod_atendente`) REFERENCES `atendente` (`cod_atendente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cod_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET CHARacter_SET_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,1,1,'14:00','2012-07-30'),(2,2,2,'15:00','2012-07-30'),(3,2,5,'17:00','2015-06-06');
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo_livro`
--

DROP TABLE IF EXISTS `emprestimo_livro`;
/*!40101 SET @saved_cs_client     = @@CHARacter_SET_client */;
/*!50503 SET CHARacter_SET_client = utf8mb4 */;
CREATE TABLE `emprestimo_livro` (
  `cod_emprestimo_livro` INT(5) NOT NULL AUTO_INCREMENT,
  `emprestado` tinyINT(4) NOT NULL DEFAULT '0',
  `data_prevista_entrega` date DEFAULT NULL,
  `cod_emprestimo` INT(5) DEFAULT NULL,
  `cod_livro` INT(5) NOT NULL,
  PRIMARY KEY (`cod_emprestimo_livro`),
  KEY `cod_emprestimo` (`cod_emprestimo`),
  KEY `cod_livro` (`cod_livro`),
  CONSTRAINT `cod_emprestimo` FOREIGN KEY (`cod_emprestimo`) REFERENCES `emprestimo` (`cod_emprestimo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cod_livro` FOREIGN KEY (`cod_livro`) REFERENCES `livro` (`cod_livro`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET CHARacter_SET_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo_livro`
--

LOCK TABLES `emprestimo_livro` WRITE;
/*!40000 ALTER TABLE `emprestimo_livro` DISABLE KEYS */;
INSERT INTO `emprestimo_livro` VALUES (1,1,'2015-06-15',1,1),(2,1,'2015-11-15',1,2),(3,1,'2015-10-15',2,3),(4,1,'2015-09-15',2,3),(5,0,NULL,NULL,4),(6,1,'2015-06-28',3,4);
/*!40000 ALTER TABLE `emprestimo_livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@CHARacter_SET_client */;
/*!50503 SET CHARacter_SET_client = utf8mb4 */;
CREATE TABLE `livro` (
  `cod_livro` INT(5) NOT NULL AUTO_INCREMENT,
  `isbn` varCHAR(10) NOT NULL,
  `ano_publicacao` INT(4) NOT NULL,
  `edicao` varCHAR(50) NOT NULL,
  `titulo` varCHAR(50) NOT NULL,
  PRIMARY KEY (`cod_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET CHARacter_SET_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'33334444',2007,'Editora Juliani','Banco de Dados'),(2,'33335555',2010,'Editora Pearson','Lógica de Programação'),(3,'33336666',2009,'Editora Pearson','Engenharia de Software'),(4,'33337777',2011,'Editora Pearson','Scrum');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@CHARacter_SET_client */;
/*!50503 SET CHARacter_SET_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cod_usuario` INT(5) NOT NULL AUTO_INCREMENT,
  `cod_curso` INT(5) NOT NULL,
  `nome` varCHAR(45) NOT NULL,
  `email` varCHAR(35) NOT NULL,
  `senha` varCHAR(8) NOT NULL,
  `telefone` CHAR(14) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `datanAScimento` date DEFAULT NULL,
  PRIMARY KEY (`cod_usuario`),
  KEY `cod_curso` (`cod_curso`),
  CONSTRAINT `cod_curso` FOREIGN KEY (`cod_curso`) REFERENCES `curso` (`cod_curso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET CHARacter_SET_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'DouglAS Juliani','douglAS.juliani@ifsc.edu.br','12345678','(48)99999-9999',3250.25,'1980-01-12'),(2,2,'Janaina','jana@ifsc.edu.br','12345678','(48)99999-9998',7200.00,'1970-10-25'),(3,3,'Fedra','douglAS.juliani@ifsc.edu.br','12345678','(48)99999-9997',3773.65,'1977-02-12'),(4,4,'Alex','alex@ifsc.edu.br','12345678','(48)99999-9996',1789.98,'1980-03-25'),(5,1,'Juliano','juliano@ifsc.edu.br','12345678','(48)99999-9995',1789.99,'1977-04-10');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for databASe 'atividade5'
--

--
-- Dumping routines for databASe 'atividade5'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-14 21:41:23

#1. Listar o nome do usuario e o nome dos seus dependentes
SELECT usuario.nome, dependente.nome FROM usuario, dependente
WHERE usuario.cod_usuario = dependente.cod_usuario;

#2. Listar  o  nome  do  usuario  e  o  nome  dos  seus  dependentes  ordenado  por  usuario  e dependente em ordem alfabética.
SELECT usuario.nome, dependente.nome FROM usuario, dependente
WHERE usuario.cod_usuario = dependente.cod_usuario  ORDER BY usuario.nome, dependente.nome;

#3.  Mostrar a quantidade de dependentes que o usuario fedra tem 
SELECT usuario.nome, count(dependente.nome) AS Quantidade_Dependentes
FROM usuario, dependente WHERE usuario.cod_usuario = dependente.cod_usuario AND usuario.nome LIKE 'Fedra';

#4. Criar a coluna sexo na tabela dependente como CHAR(1) e inserir M ou F de acordo com o nome do dependente.
ALTER TABLE dependente 
ADD COLUMN Sexo CHAR(1) DEFAULT 'F';
UPDATE dependente SET Sexo = 'M' WHERE dependente.cod_dependente = 2;
UPDATE dependente SET Sexo = 'M' WHERE dependente.cod_dependente = 5;
UPDATE dependente SET Sexo = 'M' WHERE dependente.cod_dependente = 6;

#OUTRA MANEIRA DE FAZER 
ALTER TABLE dependente ADD sexo CHAR(1);
UPDATE dependente SET sexo = 'F' WHERE cod_dependente = 1;
UPDATE dependente SET sexo = 'M' WHERE cod_dependente = 2;
UPDATE dependente SET sexo = 'F' WHERE cod_dependente = 3;
UPDATE dependente SET sexo = 'F' WHERE cod_dependente = 4;
UPDATE dependente SET sexo = 'M' WHERE cod_dependente = 5;
UPDATE dependente SET sexo = 'M' WHERE cod_dependente = 6;
UPDATE dependente SET sexo = 'F' WHERE cod_dependente = 7;

#5. Mostrar quantos dependentes são do sexo mASculino.
SELECT count(*) AS MASculino FROM dependente WHERE sexo LIKE 'M'; 

#6. Mostrar quantos dependentes são do sexo feminino.
SELECT count(*) AS Feminino FROM dependente WHERE sexo LIKE 'F'; 

#7. Mostrar o dependente do usuario fedra que tem a maior idade
SELECT dependente.nome AS Nome, dependente.datanAScimento AS Máximo, (SELECT(DATEDIFF(CURDATE(), dependente.datanAScimento)) DIV 365) 
AS idade FROM usuario, dependente
WHERE usuario.cod_usuario = dependente.cod_usuario AND usuario.nome LIKE 'Fedra' ORDER BY dependente.datanAScimento ASC limit 1;

#8. Mostrar o dependente do usuario fedra que tem a menor idade  
SELECT dependente.nome AS Nome, dependente.datanAScimento AS Menor, (SELECT(DATEDIFF(CURDATE(), dependente.datanAScimento)) DIV 365) 
AS idade FROM usuario, dependente
WHERE usuario.cod_usuario = dependente.cod_usuario AND usuario.nome LIKE 'Fedra' ORDER BY dependente.datanAScimento DESC limit 1;  

#9. Mostrar a diferença entre o dependente de maior idade e de menor idade do usuario fedra
SELECT datediff(max(dependente.datanAScimento),min(dependente.datanAScimento)) div 365 AS Diferença_Idade FROM dependente, usuario
WHERE usuario.cod_usuario = dependente.cod_usuario AND usuario.nome LIKE 'fedra';

#10. Mostrar a média de idade dos dependentes do usuario fedra
SELECT AVG(datediff(now(),dependente.datanAScimento)) div 365 AS Média FROM dependente, usuario
WHERE usuario.cod_usuario = dependente.cod_usuario AND usuario.nome LIKE 'fedra';

#11. Mostrar uma projeção de quanto cada funcionário receberia de aumento cASo o salario fosse reajustado em 10%.
SELECT nome, salario, round((salario*0.1),2) AS Aumento FROM usuario;

#12. Mostrar o novo salario de cada funcionário com o reajuste de 10%.
SELECT nome, round((salario*1.1),2) AS Salário_Total FROM usuario;

#13. Mostrar o nome de todos os funcionarios que não comecem o nome pela letra a (usar o not LIKE)
SELECT nome FROM usuario WHERE nome not LIKE 'a%';

#14. Criar a coluna esporte na tabela dependente como varCHAR(20) e executar o script abaixo
ALTER TABLE dependente ADD esporte varCHAR(20);
UPDATE dependente SET esporte = 'bASquetinho' WHERE (cod_dependente = '1');
UPDATE dependente SET esporte = 'bASquete' WHERE (cod_dependente = '2');
UPDATE dependente SET esporte = 'volei' WHERE (cod_dependente = '3');
UPDATE dependente SET esporte = 'bASquetebol' WHERE (cod_dependente = '4');
UPDATE dependente SET esporte = 'futeba' WHERE (cod_dependente = '5');
UPDATE dependente SET esporte = 'futebol' WHERE (cod_dependente = '6');
UPDATE dependente SET esporte = 'voleibol' WHERE (cod_dependente = '7');

#15. Mostrar os dependentes agrupados por esporte
SELECT nome AS Dependente, esporte AS Esporte  FROM dependente group by esporte;