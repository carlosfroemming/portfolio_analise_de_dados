# As Exportações do Brasil em 2022

## Introdução

Este projeto tem como objetivo analisar os dados de exportação do Brasil no ano de 2022, utilizando os dados do Ministério do Desenvolvimento, Indústria, Comércio e Serviços, disponibilizados como Estatísticas de Comércio Exterior em Dados Abertos. A base de dados detalhada por Município da empresa exportadora/importadora e Posição do Sistema Harmonizado (SH4) foi explorada e processada para obter insights significativos.

Etapas do Projeto
1. Preparação dos Dados (Python - Jupyter Notebook)
Os dados brutos foram baixados das Estatísticas de Comércio Exterior em Dados Abertos.
Realizou-se o tratamento e a limpeza dos dados, incluindo a remoção de valores nulos e outliers.
Foram realizadas análises exploratórias para compreender melhor a estrutura dos dados.
2. Modelagem de Dados (MySQL)
Foi criado um modelo de dados no MySQL Workbench com base nas necessidades do projeto.
O diagrama de entidade-relacionamento (ER) foi desenvolvido para representar a estrutura do banco de dados.
O MySQL Workbench gerou o código SQL para criar as tabelas, índices e relacionamentos.
3. Importação dos Dados
Os dados tratados no Python foram importados para o banco de dados MySQL.
4. Desenvolvimento do Dashboard (Microsoft Power BI)
Um dashboard interativo foi criado no Microsoft Power BI para explorar os dados de exportação.
Foram incluídas segmentações de dados para selecionar por país, total exportado em US$, transações comerciais, total exportado em toneladas, número de produtos diferentes comercializados e produto mais exportado.
Um ranking de exportações por estado brasileiro em total US$ foi incorporado, permitindo a seleção de exportações por município e produto.
Gráficos de linha do tempo das exportações em US$ por mês de 2022, treemaps e mapas interativos também foram incluídos.
Resultados e Insights
Os resultados da análise revelaram os principais países de destino das exportações brasileiras em 2022, bem como os produtos mais exportados.
A segmentação por estado brasileiro permitiu identificar estados com altos volumes de exportação e os produtos que lideram as exportações em cada estado.
O gráfico de linha do tempo destacou padrões sazonais nas exportações ao longo do ano.
O treemap e o mapa interativo forneceram uma visão geral clara dos produtos exportados e dos principais destinos.
Conclusão
Este projeto demonstra a capacidade de adquirir, processar e analisar dados de exportação do Brasil em 2022, desde a limpeza inicial dos dados até a criação de um dashboard interativo no Microsoft Power BI. As análises realizadas forneceram informações valiosas sobre as exportações brasileiras, seus principais mercados e produtos. O conhecimento adquirido pode ser usado para orientar estratégias de exportação e tomada de decisões comerciais.
