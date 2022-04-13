drop database if exists gene;

create database gene;

use gene;

create table go (
GeneID int,
GO_ID VARCHAR(140),
Evidence VARCHAR(10),
Qualifier VARCHAR(50),
GO_term text
);

create table gene_symbol (
gene_ID int primary key,
symbol VARCHAR(30)
);

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\gene_symbols.txt"  
INTO TABLE gene_symbol
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\go.txt"  
INTO TABLE go
FIELDS TERMINATED BY '\t' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

alter table go drop column Qualifier;

create view gene_view as
select go.*, gene_symbol.symbol from go, gene_symbol
where go.GeneID = gene_symbol.gene_ID;

select * from gene_view;

#l5NxKNmxzH3YGt2ZrUxhkkyIn5yIzbh90l7uCeGJoiU



