
-- select * from atores;
-- select * from filmes;
-- select * from ElencoFilme;
-- select * from generos;
-- select * from FilmesGenero;

-- ## 1 - Buscar o nome e ano dos filmes
    select 
         f.Nome
        ,f.Ano 
    from 
        Filmes as f
;

-- ## 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
    select 
         f.Nome
        ,f.Ano
    from 
        Filmes as f 
    order by 
        f.ano asc
;

-- ## 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
    select 
         f.Nome
        ,f.Ano
        ,f.Duracao 
    from 
        Filmes as f 
    where 
        f.nome like '%volta para o futuro%'
    order by 
        f.ano asc
;

-- ## 4 - Buscar os filmes lançados em 1997
    select 
         f.Nome
        ,f.Ano
        ,f.Duracao 
    from 
        Filmes as f 
    where 
        f.Ano = 1997
;

-- ## 5 - Buscar os filmes lançados APÓS o ano 2000
    select 
         f.Nome
        ,f.Ano
        ,f.Duracao 
    from 
        Filmes as f 
    where 
        f.Ano >= 2000
;

-- ## 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
    select 
         f.Nome
        ,f.Ano
        ,f.Duracao 
    from 
        Filmes as f 
    where 
        f.Duracao between 100 and 150
        -- outra opção seria
        -- f.Duracao >= 100 and f.Duracao <= 150
    order by 
        f.duracao asc
;

-- ## 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
    select 
        f.Ano
        ,count(Duracao) Quantidade
    from 
        Filmes as f 
    group by 
        f.Ano
    order by 
        count(Duracao) desc
;

-- ## 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
    select
         a.PrimeiroNome
        ,a.UltimoNome
    from 
        atores as a
    where 
        a.genero = 'M'
;

-- ## 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
    select
         a.PrimeiroNome
        ,a.UltimoNome
    from 
        atores as a
    where 
        a.genero = 'F'
    order by 
        a.PrimeiroNome
;

-- ## 10 - Buscar o nome do filme e o gênero
    select
         f.Nome
        ,g.Genero
    from 
        Filmes          as f
    inner join
        FilmesGenero    as fg   on f.id         = fg.idFilme
    inner join 
        Generos         as g    on fg.idGenero  = g.id
;

-- ## 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
    select
         f.Nome
        ,g.Genero
    from 
        Filmes          as f
    inner join
        FilmesGenero    as fg   on f.id         = fg.idFilme
    inner join 
        Generos         as g    on fg.idGenero  = g.id
    where 
        genero like '%mist%rio%'
;

-- ## 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
    select
         f.Nome
        ,a.PrimeiroNome
        ,a.UltimoNome
        ,ef.papel
    from 
        Filmes      as f
    inner join
        Elencofilme as ef  on f.id         = ef.idFilme
    inner join 
        Atores      as a   on ef.idAtor    = a.id
;
