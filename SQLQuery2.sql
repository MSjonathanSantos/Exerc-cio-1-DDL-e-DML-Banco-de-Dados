USE exer1
GO

EXEC sp_helpconstraint 'projects' 
/*Isso acontece porque remover o CHECK antigo não apaga os dados que já estão salvos dentro da tabela.

Mesmo sem nenhuma restrição ativa no momento, os registros antigos (como 05/09/2014, 06/09/2014 e 07/09/2014) continuam lá gravados nas linhas.*/
ALTER TABLE projects WITH NOCHECK--N VERIFICA O OS DADOS PASSADOS 
ADD CONSTRAINT resDate CHECK (date_proj > '2014-09-12');

--OU O JEITO PARA APGAR 100%

UPDATE projects 
SET date_proj = '2014-09-12'     -- Exemplo: '2014-09-13' (uma data válida maior que a limite)
WHERE date_proj <= '2014-09-11'; -- Exemplo: '2014-09-12' (filtra as datas antigas/inválidas)

-- 2. Adicionar a restrição 100% confiável
ALTER TABLE projects 
ADD CONSTRAINT resDate CHECK (date_proj > 'DATA_LIMITE_DA_REGRA'); -- Exemplo: '2014-09-12'
/*Mudar o nome da coluna: EXEC sp_rename 'tabela.coluna_antiga', 'coluna_nova', 'COLUMN'

Mudar o tipo/tamanho da coluna: ALTER TABLE tabela ALTER COLUMN coluna VARCHAR(50)*/

UPDATE users
SET username = 'Rh_cido'
WHERE Name='Aparecido';

UPDATE users
SET password='888@*'
WHERE username='Rh_maria'
	AND password='123mudar';

SELECT * FROM users
SELECT * FROM user_has_projects

DELETE user_has_projects
WHERE users_id = 2;




