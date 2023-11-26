-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 26/11/2023 às 22:11
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `seguradora`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `sinistro`
--

CREATE TABLE `sinistro` (
  `id_sinistro` int(11) NOT NULL,
  `nome_sinistro` varchar(20) NOT NULL,
  `descricao_sinistro` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sinistro`
--

INSERT INTO `sinistro` (`id_sinistro`, `nome_sinistro`, `descricao_sinistro`) VALUES
(1, 'Pequena Monta', 'Danos leves ao veículo. Geralmente, os reparos são menores e menos dispendiosos. Os custos de reparo podem ser cobertos pelo seguro abrangente.'),
(2, 'Média Monta', 'Danos moderados ao veículo. Os custos de reparo estão além do que seria considerado \"pequena monta\", mas o veículo ainda pode ser reparado. Às vezes, a seguradora pode optar por pagar o valor justo de mercado do veículo em vez de cobrir os custos de reparo.'),
(3, 'Grande Monta', 'Danos severos ao veículo. Os custos de reparo são significativos e podem exceder o valor de mercado do veículo. Em alguns casos, o veículo pode ser considerado uma perda total, e a seguradora pode optar por indenizar o proprietário pelo valor do veículo antes do sinistro.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `ID_Usuario` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Celular` varchar(20) NOT NULL,
  `Login` varchar(50) DEFAULT NULL,
  `Senha` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`ID_Usuario`, `Nome`, `Celular`, `Login`, `Senha`) VALUES
(1, 'eric.francischett', '(41)99707-3433', 'eric.francischett', '8eea657c3f7186ec059c6ce9c32837b7'),
(2, 'Rodolfo', '(41)99999-9999', 'rodolfo.kunzel', '418a897e6d5ddc3b94d8346684732885');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id_veiculo` int(11) NOT NULL,
  `imagem` mediumblob DEFAULT NULL,
  `marca_modelo` varchar(50) NOT NULL,
  `cor` varchar(20) DEFAULT NULL,
  `ano` year(4) NOT NULL,
  `id_sinistro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `veiculos`
--

INSERT INTO `veiculos` (`id_veiculo`, `imagem`, `marca_modelo`, `cor`, `ano`, `id_sinistro`) VALUES
(1, NULL, 'Toyota Corolla', 'Prata', '2020', 3),
(2, NULL, 'Ford Fusion', 'Preto', '2018', 2),
(3, NULL, 'Honda CR-V', 'Azul', '2021', 1),
(4, NULL, 'Chevrolet Camaro', 'Vermelho', '2019', 3),
(5, NULL, 'Volkswagen Golf', 'Branco', '2017', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `sinistro`
--
ALTER TABLE `sinistro`
  ADD PRIMARY KEY (`id_sinistro`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- Índices de tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id_veiculo`),
  ADD KEY `FK_id_sinistro` (`id_sinistro`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `sinistro`
--
ALTER TABLE `sinistro`
  MODIFY `id_sinistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id_veiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`id_sinistro`) REFERENCES `sinistro` (`id_sinistro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
