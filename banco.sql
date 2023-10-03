-- Funções de String:

-- a) Tabela "nomes" com UPPER() e LENGTH():

sql
CREATE TABLE nomes (
    nome VARCHAR(50)
);

INSERT INTO nomes (nome) VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');

SELECT UPPER(nome) AS nome_maiusculo, LENGTH(nome) AS tamanho FROM nomes;



-- b) Adicionar "Sr." e "Sra." usando CONCAT(): 

sql
SELECT
    CASE WHEN nome LIKE '%Maria%' THEN CONCAT('Sra. ', nome)
         ELSE CONCAT('Sr. ', nome) END AS nome_formatado
FROM nomes;


-- Funções Numéricas:

-- a) Tabela "produtos" com ROUND() e AVG():

sql
CREATE TABLE produtos (
    produto VARCHAR(50),
    preco DECIMAL(10, 2),
    quantidade INT
);

INSERT INTO produtos (produto, preco, quantidade) VALUES
    ('Produto A', 10.123, 5),
    ('Produto B', 25.987, -2),
    ('Produto C', 15.75, 8);

SELECT ROUND(preco, 2) AS preco_arredondado, ABS(quantidade) AS quantidade_abs, AVG(preco) AS media_precos FROM produtos;



-- Funções de Data:

-- a) Tabela "eventos" com NOW() e DATEDIFF():

sql
CREATE TABLE eventos (
    data_evento DATE
);

INSERT INTO eventos (data_evento) VALUES
    ('2023-10-01'),
    ('2023-10-05'),
    ('2023-09-15');

INSERT INTO eventos (data_evento) VALUES (NOW());

SELECT DATEDIFF(NOW(), data_evento) AS dias_passados, DAYNAME(data_evento) AS nome_dia_semana FROM eventos;



-- Funções de Controle de Fluxo:

-- a) Usando a função IF():

sql
SELECT produto,
    CASE WHEN quantidade = 0 THEN 'Fora de estoque'
         ELSE 'Em estoque' END AS status_estoque
FROM produtos;



-- b) Usando a função CASE para categorizar produtos:

sql
SELECT produto,
    CASE WHEN preco < 10 THEN 'Barato'
         WHEN preco >= 10 AND preco <= 20 THEN 'Médio'
         ELSE 'Caro' END AS categoria_preco
FROM produtos;



-- Função Personalizada em Python:

python
-- # Função para calcular o valor total
def TOTAL_VALOR(preco, quantidade):
    return preco * quantidade

-- # Exemplo de uso:
preco_item = 10.0
quantidade_item = 5
total_item = TOTAL_VALOR(preco_item, quantidade_item)
print("O valor total é:", total_item)



-- Funções de Agregação:

-- a) Contar o número total de produtos:

sql
SELECT COUNT(*) AS total_produtos FROM produtos;


-- b) Produto mais caro usando MAX():

sql
SELECT produto, preco
FROM produtos
WHERE preco = (SELECT MAX(preco) FROM produtos);


-- c) Produto mais barato usando MIN():

sql
SELECT produto, preco
FROM produtos
WHERE preco = (SELECT MIN(preco) FROM produtos);



-- d) Calcular a soma total dos produtos em estoque usando SUM() e IF():

sql
SELECT SUM(IF(quantidade > 0, preco, 0)) AS total_produtos_em_estoque FROM produtos;



-- Funções Personalizadas em Python:
# Função para calcular o fatorial de um número
def fatorial(n):
    if n == 0:
        return 1
    else:
        return n * fatorial(n - 1)

# Exemplo de uso:
resultado_fatorial = fatorial(5)
print("5! =", resultado_fatorial)

# Função para calcular a potência/exponencial
def f_exponencial(base, expoente):
    return base ** expoente

# Exemplo de uso:
resultado_exponencial = f_exponencial(2, 3)
print("2^3 =", resultado_exponencial)

# Função para verificar se uma palavra é palíndromo
def e_palindromo(palavra):
    palavra = palavra.lower()
    return palavra == palavra[::-1]

# Exemplo de uso:
palavra_teste = "radar"
if e_palindromo(palavra_teste):
    print(palavra_teste, "é um palíndromo")
else:
    print(palavra_teste, "não é um palíndromo")
