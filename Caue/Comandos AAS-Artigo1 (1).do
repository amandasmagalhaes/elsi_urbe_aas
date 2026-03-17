svyset upa, strata (estrato) weight (peso_calibrado) singleunit(centered)

tab n76
tab f1
tab idade
gen filtro = 1 if n76==0 & f1==1 & idade>59
tab filtro

* AAS
tab n1
tab n1, nol

recode n1 (0 1 2 3 = 0 "Excelente/Muito boa/Boa/Regular") (4 5 =1 "Muito ruim/ruim") (9=.), gen (AAS)
tab AAS 
tab AAS filtro
svy, subpop (if filtro==1): tab AAS, percent ci

*Utilizar a subpopulação para identificar a prevalência de AAS 

svy, subpop (if filtro==1): tab AAS, ci percent 

*Utilizar a subpopulação para identificar o sexo 

svy, subpop (if filtro==1): tab sexo, ci percent 

*Bivariada
svy, subpop (if filtro==1): tab sexo AAS, ci percent row 

*======================================
recode idade (50/59=5 "50 a 59") (60/64=1 "60 a 64") (65/69=2 "65 a 69") (70/74=3 "70 a 74") (75/max=4 "75+"), gen (idadeTT)

tab idadeTT

*Recodificar a idade 



recode idade (50/59=.) (60/64=1 "60 a 64") (65/69=2 "65 a 69") (70/74=3 "70 a 74") (75/max=4 "75+"), gen (idadeX)

****Recode conforme o artigo Sutil et al 2024
recode idade (50/59=.) (60/69=1 "60 a 69") (70/79=2 "70 a 79") (80/max=3 "80+"), gen (idadeX1)


*Identificar a nova variável gerada (idadeX) 

tab idadeX1 

*Identificar por idade 

svy, subpop (if filtro==1): tab idadeX, ci percent 

svy, subpop (if filtro==1): tab idadeX1, ci percent 

*Considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab idadeX1, ci percent

svy, subpop (if filtro==1 & sexo==1): tab idadeX1, ci percent


*Bivariada
svy, subpop (if filtro==1): tab idadeX AAS, ci percent row 

svy, subpop (if filtro==1): tab idadeX1 AAS, ci percent row 

*Considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab idadeX1 AAS, ci percent row 

svy, subpop (if filtro==1 & sexo==1): tab idadeX1 AAS, ci percent row 

*======================================

*Identificar a Cor 
tab e9, nol

recode e9 (1=0 "branca") (2=1 "preta") (3=2 "parda") (4 5 9 =.), gen (cor)

tab cor

svy, subpop (if filtro==1): tab cor, ci percent 

*Considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab cor, ci percent 

svy, subpop (if filtro==1 & sexo==1): tab cor, ci percent

**Bivariada

svy, subpop (if filtro==1): tab cor AAS, ci percent row 

*Considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab cor AAS, ci percent row 

svy, subpop (if filtro==1 & sexo==1): tab cor AAS, ci percent row 

*======================================

*Identificar a Escolaridade / Primeiro recodificar: 

recode e22 (99=.) (1 =1 "Analfabeto") (2 3 4 5 = 2 "1-4") (6 7 8 9 = 3 "5-8") (10 11 12 13=4 "9-11") (14 15 16 17 18=5 "12+"), gen (Escolaridade) 

*Filtro aplicado 

svy, subpop (if filtro==1): tab Escolaridade, ci percent 

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab Escolaridade, ci percent 

svy, subpop (if filtro==1 & sexo==1): tab Escolaridade, ci percent 

*Bivariada
svy, subpop (if filtro==1): tab Escolaridade AAS, ci percent row 

**Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab Escolaridade AAS, ci percent row 

svy, subpop (if filtro==1 & sexo==1): tab Escolaridade AAS, ci percent row 

*======================================

*Identificar a Situação Conjugal 

tab e7 

*Filtro aplicado 

svy, subpop (if filtro==1): tab e7, ci percent 

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab e7, ci percent 

svy, subpop (if filtro==1 & sexo==1): tab e7, ci percent 

*Bivariada
svy, subpop (if filtro==1): tab e7 AAS, ci percent row 
 
 *Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab e7 AAS, ci percent row 
 
 svy, subpop (if filtro==1 & sexo==1): tab e7 AAS, ci percent row 
 
 
 
*======================================

*Identificar o Tempo de Residência 

tab e5, nol 

*Recodificar 

recode e5 (0/19=1 "0-19") (20/39=2 "20-30") (40/49=3 "40-49") (50/59=4 "50-59") (60/max=5 "60+"), gen (Tempo_Residencia) 

*Igual no artigo Sutil et al 2024
recode e5 (0/19=1 "0-19") (20/39=2 "20-39") (40/59=3 "40-59") (60/max=4 "60+"), gen (Tempo_ResidenciaX3) 

*Apresentar 

tab Tempo_Residencia 

*Identificar na subpopulação o tempo de residência 

svy, subpop (if filtro==1): tab Tempo_Residencia, ci percent 

 *Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab Tempo_Residencia, ci percent 

 
svy, subpop (if filtro==1 & sexo==1): tab Tempo_Residencia, ci percent 


svy, subpop (if filtro==1): mean Tempo_Residencia 

*Bivariada
svy, subpop (if filtro==1): tab Tempo_Residencia AAS, ci percent row 

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab Tempo_Residencia AAS, ci percent row 

svy, subpop (if filtro==1 & sexo==1): tab Tempo_Residencia AAS, ci percent row 


svy, subpop (if filtro==1): tab Tempo_ResidenciaX3 AAS, ci percent row 
 
*=====================================

*Número de moradores na residência 

*Variável nmoradores - Total de 01 a 15 moradores 

*Recodificar o número de moradores 
recode nmoradores (1=1 "1") (2=2 "2") (3=3 "3") (4=4 "4")(5/max=5 "5+"), gen (moradoresX)

svy, subpop (if filtro==1): tab moradoresX, ci percent 

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab moradoresX, ci percent 

svy, subpop (if filtro==1 & sexo==1): tab moradoresX, ci percent


*Bivariada
svy, subpop (if filtro==1): tab moradoresX AAS, ci percent row


*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab moradoresX AAS, ci percent row

svy, subpop (if filtro==1 & sexo==1): tab moradoresX AAS, ci percent row
 *=====================================

*Renda per capita mensal domiciliar total 

*2021: R$ 1100,00 

*Recodificar  

recode rendadompc (min/1099=1 "<1")  (1100/3299=2 ">1 e <3") (3300/max = 3 ">3"), gen (rendadpc) 

*Identificar na subpopulação a renda per capita 

svy, subpop (if filtro==1): tab rendadpc, ci percent 

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab rendadpc, ci percent 

svy, subpop (if filtro==1 & sexo==1): tab rendadpc, ci percent 

svy, subpop (if filtro==1): mean rendadpc

*Bivariada
svy, subpop (if filtro==1): tab rendadpc AAS, ci percent row

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab rendadpc AAS, ci percent row

svy, subpop (if filtro==1 & sexo==1): tab rendadpc AAS, ci percent row

**====================================================

*VARIÁVEIS DE AJUSTE: CARACTERÍSTICAS DE SAÚDE 
*doença crônica não transmissível autorreferida (nenhuma; uma; duas ou mais)  

* Criar uma variável que soma todas as doenças crônicas 
*n28 HA / n35 DM / n44 colesterol alto / n46 IAM / n48 angina / n50 IC / n52 AVC
*n54 asma / n55 DPOC / n56 artrite / n57 osteoporose / n59 depressão / n60 câncer / n61 DRC / n62 parkinson

gen num_doencas = n28 + n35 + n44 + n46 + n48 + n50 + n52 + n54 + n55 + n56 + n57 + n59 + n60 + n61 + n62  

* Criar uma variável categórica baseada no número de doenças crônicas 

gen doencas_cronicas = . 

replace doencas_cronicas = 0 if num_doencas == 0        // Nenhuma 
replace doencas_cronicas = 1 if num_doencas == 1         // Uma 
replace doencas_cronicas = 2 if num_doencas >= 2         // Duas ou mais 


* Adicionar rótulos às categorias 

label define doencas_lbl 0 "Nenhuma" 1 "Uma" 2 "Duas ou mais" 

label values doencas_cronicas doencas_lbl 

 * Verificar a distribuição da variável 

tab doencas_cronicas 

* Verificar a % e IC da variável 

svy, subpop (if filtro==1): tab doencas_cronicas, ci percent 

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1 & sexo==0): tab doencas_cronicas, ci percent 

svy, subpop (if filtro==1 & sexo==1): tab doencas_cronicas, ci percent 

*Bivariada
svy, subpop (if filtro==1): tab doencas_cronicas AAS, ci percent row

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1  & sexo==0): tab doencas_cronicas AAS, ci percent row

svy, subpop (if filtro==1  & sexo==1): tab doencas_cronicas AAS, ci percent row


*========================================================

***número de consultas médicas nos doze meses anteriores à entrevista (nenhuma; uma ou duas; três ou mais) [u6] 

**Variável N consultas 

* Substituir 99 por missing na variável original 

replace u6 = . if u6 == 99  

* Criar a variável categórica 

gen consultas_medicas = . 

* Atribuir as categorias 

replace consultas_medicas = 0 if u6 == 0                     // Nenhuma 
replace consultas_medicas = 1 if u6 == 1 | u6 == 2          // Uma ou duas 
replace consultas_medicas = 2 if u6 >= 3                    // Três ou mais 

* Definir rótulos das categorias 

label define consultas_lbl 0 "Nenhuma" 1 "Uma ou duas" 2 "Três ou mais" 

label values consultas_medicas consultas_lbl  

* Verificar a distribuição da variável 

tab consultas_medicas, missing   

* Verificar a % e IC da variável 

svy, subpop (if filtro==1): tab consultas_medicas, ci percent 

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1  & sexo==0): tab consultas_medicas, ci percent 

svy, subpop (if filtro==1  & sexo==1): tab consultas_medicas, ci percent 
 
 *Bivariada
svy, subpop (if filtro==1): tab consultas_medicas AAS, ci percent row

*Discriminar por sexo (0=F / 1=M)

svy, subpop (if filtro==1  & sexo==0): tab consultas_medicas AAS, ci percent row

svy, subpop (if filtro==1  & sexo==1): tab consultas_medicas AAS, ci percent row

*===========================================

***VARIÁVEL CONSUMO DE FRUTAS, LEGUMES E VERDURAS (FLV)

tab1 l15 l19
recode  l15 (9=.), gen (l15c)
recode  l19 (9=.), gen (l19c)
tab1 l15c l19c
gen consregFH = l15c + l19c
tab consregFH
recode  consregFH (0/4=0 "<5") (5/max=1 ">=5") (9=.), gen (regularFH)
tab regularFH

svy, subpop (if filtro==1): tab regularFH, percent ci

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab regularFH, percent ci 

svy, subpop (if filtro==1 & sexo==1): tab regularFH, percent ci 


**bivariada

svy, subpop (if filtro==1): tab regularFH AAS, percent ci row

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab regularFH AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab regularFH AAS, percent ci row

*===========================================

**Atividade física
*Código da atualizado**
* Calcular o tempo total de caminhada (em minutos)
gen minutos_caminhada6 = .
replace minutos_caminhada6 = l5 * ((l6_1 * 60) + l6_2) if l5 >= 0 & !missing(l5, l6_1, l6_2)

* Calcular o tempo total de atividades moderadas (em minutos)
gen minutos_moderadas6 = .
replace minutos_moderadas6 = l7 * ((l8_1 * 60) + l8_2) if l7 >= 0 & !missing(l7, l8_1, l8_2)

* Calcular o tempo total de atividades vigorosas (em minutos, com peso dobrado)
gen minutos_vigorosas6 = .
replace minutos_vigorosas6 = l9 * 2 * ((l10_1 * 60) + l10_2) if l9 >= 0 & !missing(l9, l10_1, l10_2)

* Calcular o tempo total de atividade física semanal
gen minutos_totais6 = .
replace minutos_totais6 = minutos_caminhada6 + minutos_moderadas6 + minutos_vigorosas6 if !missing(minutos_caminhada6, minutos_moderadas6, minutos_vigorosas6)

* Classificar em "Recomendado" (>=150 minutos) e "Não recomendado" (<150 minutos)
gen atividade_recomendada6 = .
replace atividade_recomendada6 = 1 if minutos_totais6 >= 150
replace atividade_recomendada6 = 0 if minutos_totais6 < 150

* Adicionar rótulos às categorias
label define atividade6_lbl 0 "Não recomendado" 1 "Recomendado"
label values atividade_recomendada6 atividade6_lbl

svy, subpop (if filtro==1): tab atividade_recomendada6, percent ci

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab atividade_recomendada6, percent ci 

svy, subpop (if filtro==1 & sexo==1): tab atividade_recomendada6, percent ci 


**bivariada

svy, subpop (if filtro==1): tab atividade_recomendada6 AAS, percent ci row

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab atividade_recomendada6 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab atividade_recomendada6 AAS, percent ci row
*===========================================================

*Cálculo do consumo semanal de álcool  

*Recodificar

recode l24 (9=.) (1=0 "Não") (2 3=1 "Sim") , gen (consumo_alcool)
tab consumo_alcool

* Foi considerado consumo abusivo de bebidas alcoólicas cinco ou mais
*doses (homem) ou quatro ou mais doses (mulher) em uma única ocasião, pelo menos
*uma vez nos últimos 30 dias

gen consumo_abusivo =consumo_alcool
replace consumo_abusivo = 0 if l25==0
replace consumo_abusivo = 0 if l26==0

replace consumo_abusivo = 2 if (l26>=5 & l26<=20) & (l25>=1 & l25<=7) & sexo==1 & consumo_abusivo==1

replace consumo_abusivo = 2 if (l26>=4 & l26<=20) & (l25>=1 & l25<=7) & sexo==0 & consumo_abusivo==1
 
replace consumo_abusivo = 0 if consumo_abusivo==1
 
tab consumo_abusivo
tab l25, nol
tab l26

*Exibir estatísticas descritivas 

tab consumo_alcool

*Verificar a % e IC da variável com amostragem complexa 

svy, subpop(if filtro==1): tab consumo_alcool, ci percent 

svy, subpop(if filtro==1): tab consumo_abusivo, ci percent 

*Considerar o sexo

svy, subpop(if filtro==1 & sexo==0): tab consumo_alcool, ci percent 

svy, subpop(if filtro==1 & sexo==1): tab consumo_alcool, ci percent 


svy, subpop(if filtro==1 & sexo==0): tab consumo_abusivo, ci percent 

svy, subpop(if filtro==1 & sexo==1): tab consumo_abusivo, ci percent

*Bivariada
svy, subpop (if filtro==1): tab consumo_alcool AAS, ci percent row

*Considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab consumo_alcool AAS, ci percent row

svy, subpop (if filtro==1 & sexo==1): tab consumo_alcool AAS, ci percent row


svy, subpop (if filtro==1 & sexo==0): tab consumo_abusivo AAS, ci percent row

svy, subpop (if filtro==1 & sexo==1): tab consumo_abusivo AAS, ci percent row

*=====================================================
*tabagismo (corrigida)
código 8 indica que não fuma

tab l30_0
tab l30

recode l30 (1/2=1 "Fuma") (3 8=0 "Não Fuma") (9=.), gen (consumo_tabaco1)

tab consumo_tabaco1


*tabagismo 

*Verificar a % e IC da variável
svy, subpop (if filtro==1): tab consumo_tabaco1, ci percent

*Considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab consumo_tabaco1, ci percent

svy, subpop (if filtro==1 & sexo==1): tab consumo_tabaco1, ci percent

*Bivariada
svy, subpop (if filtro==1): tab consumo_tabaco1 AAS, ci percent row

*Considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab consumo_tabaco1 AAS, ci percent row

svy, subpop (if filtro==1 & sexo==1): tab consumo_tabaco1 AAS, ci percent row


*----------------------------------------------
*================================================

*Análise de desordem (Pixação e lixo..)

***Prédios pixados
tab f2
recode f2 (0=0 "Não") (1=1 "Sim") (8 9 =.), gen (f2_1)
tab f2_1
svy, subpop (if filtro==1): tab f2_1, percent ci

*considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab f2_1, percent ci

svy, subpop (if filtro==1 & sexo==1): tab f2_1, percent ci

*Bivariada AAS

svy, subpop (if filtro==1): tab f2_1 AAS, percent ci row

*considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab f2_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f2_1 AAS, percent ci row


***Lixo
tab f3
recode f3 (0=0 "Não") (1=1 "Sim") (8 9 =.), gen (f3_1)
tab f3_1
svy, subpop (if filtro==1): tab f3_1, percent ci

*considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab f3_1, percent ci

svy, subpop (if filtro==1 & sexo==1): tab f3_1, percent ci

*Bivariada AAS

svy, subpop (if filtro==1): tab f3_1 AAS, percent ci row

*considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab f3_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f3_1 AAS, percent ci row

***Rato
tab f6
recode f6 (0=0 "Não") (1=1 "Sim") (8 9 =.), gen (f6_1)
tab f6_1

svy, subpop (if filtro==1): tab f6_1, percent ci

*considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab f6_1, percent ci

svy, subpop (if filtro==1 & sexo==1): tab f6_1, percent ci

*Bivariada AAS

svy, subpop (if filtro==1): tab f6_1 AAS, percent ci row

*considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab f6_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f6_1 AAS, percent ci row

*Indicador de desordem2
gen sum_desordem2 = f2_1 + f3_1 + f6_1
tab sum_desordem2
recode sum_desordem2 (0=0 "Não") (1 2 3=1 "Sim") (8 9 =.), gen (desordem2)
tab desordem2
svy, subpop (if filtro==1): tab desordem2, percent ci
*Análise de consistência

alpha f2_1 f3_1 f6_1

*considerar o sexo

svy, subpop (if filtro==1 & sexo==0): tab desordem2, percent ci

svy, subpop (if filtro==1 & sexo==1): tab desordem2, percent ci

*bivariada

svy, subpop (if filtro==1): tab desordem2 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab desordem2 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab desordem2 AAS, percent ci row

* ruído
tab f4
recode f4 (0=0 "Não") (1 =1 "Sim") (8 9 =.), gen (f4_1)
tab f4_1
svy, subpop (if filtro==1): tab f4_1, percent ci

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f4_1, percent ci

svy, subpop (if filtro==1 & sexo==1): tab f4_1, percent ci

*bivariada

svy, subpop (if filtro==1): tab f4_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f4_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f4_1 AAS, percent ci row


* problema de mobilidade
*medo de cair por causa de defeitos nos passeios/calçadas
tab f7
recode f7 (0=0 "Não") (1 =1 "Sim") (8 9 =.), gen (f7_1)
tab f7_1
svy, subpop (if filtro==1): tab f7_1 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f7_1 , percent ci 

svy, subpop (if filtro==1 & sexo==1): tab f7_1 , percent ci 

*bivariada

svy, subpop (if filtro==1): tab f7_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f7_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f7_1 AAS, percent ci row

*preocupação com a dificuldade para subir no ônibus
tab f8
recode f8 (0=0 "Não") (1 =1 "Sim") (8 9 =.), gen (f8_1)
tab f8_1
svy, subpop (if filtro==1): tab f8_1 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f8_1 , percent ci 

svy, subpop (if filtro==1 & sexo==1): tab f8_1 , percent ci 

*bivariada

svy, subpop (if filtro==1): tab f8_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f8_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f8_1 AAS, percent ci row


*preocupação com a dificuldade para atravessar a rua
tab f9
recode f9 (0=0 "Não") (1 =1 "Sim") (8 9 =.), gen (f9_1)
tab f9_1
svy, subpop (if filtro==1): tab f9_1 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f9_1 , percent ci

svy, subpop (if filtro==1 & sexo==1): tab f9_1 , percent ci

*bivariada

svy, subpop (if filtro==1): tab f9_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f9_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f9_1 AAS, percent ci row

*problema de mobilidade
gen soma_dif_mob= f7_1 + f8_1 + f9_1
tab soma_dif_mob
recode soma_dif_mob (0=0 "Não") (1/3=1 "Sim"), gen (dif_mobilidade)
tab dif_mobilidade

alpha f7_1 f8_1 f9_1

svy, subpop (if filtro==1): tab dif_mobilidade , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab dif_mobilidade , percent ci 

svy, subpop (if filtro==1 & sexo==1): tab dif_mobilidade , percent ci 

*bivariada

svy, subpop (if filtro==1): tab dif_mobilidade AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab dif_mobilidade AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab dif_mobilidade AAS, percent ci row


*Ambiente social

*segurança
tab f5
recode f5 (1=1 "Muito segura") (2=2 "Segura")(3=3 "Muito insegura") (8 9 =.), gen (f5_1)
tab f5_1
svy, subpop (if filtro==1): tab f5_1, percent ci

recode f5 (1 2=0 "Muito segura/segura") (3=1 "Muito insegura") (8 9 =.), gen (f5_2)
tab f5_2
svy, subpop (if filtro==1): tab f5_2, percent ci

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f5_2, percent ci

svy, subpop (if filtro==1 & sexo==1): tab f5_2, percent ci

*bivariada

svy, subpop (if filtro==1): tab f5_2 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f5_2 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f5_2 AAS, percent ci row

*violência: vítima de furto, roubo ou teve a sua residência invadida
tab f10
recode f10 (0=0 "Não") (1 =1 "Sim") (8 9 =.), gen (f10_1)
tab f10_1
svy, subpop (if filtro==1): tab f10_1 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f10_1 , percent ci 

svy, subpop (if filtro==1 & sexo==1): tab f10_1 , percent ci 

*bivariada

svy, subpop (if filtro==1): tab f10_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f10_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f10_1 AAS, percent ci row


*bom lugar para se viver
tab f11
recode f11 (0 1 =0 "Não") (2 =1 "Sim") (8 9 =.), gen (f11_1)
tab f11_1
svy, subpop (if filtro==1): tab f11_1 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f11_1 , percent ci 

svy, subpop (if filtro==1 & sexo==1): tab f11_1 , percent ci 

*bivariada

svy, subpop (if filtro==1): tab f11_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f11_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f11_1 AAS, percent ci row


*coesão social
tab f12
recode f12 (0=0 "Não") (1=1 "Mais ou menos") (2=2 "Sim") (8 9 =.), gen (f12_1)
tab f12_1

*drop f12_2 (para excluir a variável do banco e corrigir)
recode f12 (0/1=0 "Não") (2=1 "Sim") (8 9 =.), gen (f12_2)
tab f12_2

svy, subpop (if filtro==1): tab f12_2 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f12_2, percent ci 

svy, subpop (if filtro==1 & sexo==1): tab f12_2 , percent ci 

*bivariada

svy, subpop (if filtro==1): tab f12_2 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f12_2 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f12_2 AAS, percent ci row

*As crianças ou os jovens da sua vizinhança tratam os adultos com respeito
tab f13
recode f13 (0 1 =0 "Não") (2 =1 "Sim") (8 9 =.), gen (f13_1)
tab f13_1
svy, subpop (if filtro==1): tab f13_1 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f13_1 , percent ci 

svy, subpop (if filtro==1 & sexo==1): tab f13_1 , percent ci 

*bivariada

svy, subpop (if filtro==1): tab f13_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f13_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f13_1 AAS, percent ci row


*A sua vizinhança é um bom lugar para as crianças brincarem e para criar adolescentes?
tab f14
recode f14 (0 1 =0 "Não") (2 =1 "Sim") (8 9 =.), gen (f14_1)
tab f14_1
svy, subpop (if filtro==1): tab f14_1 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f14_1 , percent ci

svy, subpop (if filtro==1 & sexo==1): tab f14_1 , percent ci

*bivariada

svy, subpop (if filtro==1): tab f14_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f14_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f14_1 AAS, percent ci row


* É agradável fazer caminhada, correr ou andar de bicicleta na sua vizinhança?
tab f15
recode f15 (0 1 =0 "Não") (2 =1 "Sim") (8 9 =.), gen (f15_1)
tab f15_1
svy, subpop (if filtro==1): tab f15_1 , percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab f15_1 , percent ci 

svy, subpop (if filtro==1 & sexo==1): tab f15_1 , percent ci

*bivariada

svy, subpop (if filtro==1): tab f15_1 AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab f15_1 AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab f15_1 AAS, percent ci row


**agradável (f11 f13 f14 f15)
gen sum_agradavel= f11_1 + f13_1 + f14_1 + f15_1
tab sum_agradavel
recode sum_agradavel(0=0 "não") (1/4=1 "sim"), gen (agradavel)
tab agradavel

alpha f11_1 f13_1 f14_1 f15_1

svy, subpop (if filtro==1): tab agradavel, percent ci 

*0 feminino 1 masculino

svy, subpop (if filtro==1 & sexo==0): tab agradavel, percent ci 

svy, subpop (if filtro==1 & sexo==1): tab agradavel, percent ci 

*bivariada

svy, subpop (if filtro==1): tab agradavel AAS, percent ci row

*0 feminino 1 masculino
svy, subpop (if filtro==1 & sexo==0): tab agradavel AAS, percent ci row

svy, subpop (if filtro==1 & sexo==1): tab agradavel AAS, percent ci row

log using resultado.txt, text replace

* Na análise múltipla vamos alterar a estratégia. Vamos fazer modelos separados, um modelo ajustado para cada variável do contexto
* ajuste em separado
*========================================================================================================

***CONSTRUÇÃO DA TABELA 5***

****Análise Bivariada*****
*fazer com todas as variáveis do ambiente físico e social / sexo


*Desordem Física

*FEM
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2, irr

*MASC
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.desordem2, irr

*Poluição Sonora (f4_1)
*FEM
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.f4_1, irr

*MASC
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.f4_1, irr

*Problemas de Mobilidade (dif_mobilidade)
*FEM
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.dif_mobilidade, irr

*MASC
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.dif_mobilidade, irr

*Percepção de Insegurança (f5_2)
*FEM
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.f5_2, irr

*MASC
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.f5_2, irr

*Vítima de furto/roubo (f10_1)
*FEM
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.f10_1, irr

*MASC
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.f10_1, irr


*Coesão social
*FEM
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.f12_2, irr

*MASC
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.f12_2, irr

*Ambiente Agradável
*FEM
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.agradavel, irr

*MASC
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.agradavel, irr


*========================================================================================================

****Análise MÚLTIPLA*****
*fazer com todas as variáveis do ambiente físico e social / sexo

*FEMININO (0)
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2  i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.f4_1  i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.dif_mobilidade  i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.f5_2  i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.f10_1 i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.f12_2 i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.agradavel  i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr


*MASCULINO (1)

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.desordem2  i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.f12_2 i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.dif_mobilidade i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.f4_1 i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.f5_2 i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.f10_1 i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.agradavel i.idadeX1 i.cor i.Escolaridade	i.e7 i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas i.regularFH i.atividade_recomendada6	i.consumo_abusivo i.consumo_tabaco1, irr






*========================================================================================================
****Análise multipla*****

* i.desordem2 i.f4_1 i.dif_mobilidade i.f5_2 i.f10_1 i.f12_2 i.agradavel
* f4_1 ruído i.f5_2 insegurança i.f10_1 violência i.f12_2 coesão social

*Considerar o Sexo F e M

****MULHERES****

***Passo 1 - vizinhança p< 0,20

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2 i.f4_1 i.dif_mobilidade i.f5_2 i.f10_1 i.f12_2 i.agradavel, irr

*retirado f10_1 >p-valor
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2 i.f4_1 i.dif_mobilidade i.f5_2 i.f12_2 i.agradavel, irr

*retirado agradável >p-valor
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2 i.f4_1 i.dif_mobilidade i.f5_2 i.f12_2, irr

*retirado f5_2 >p-valor
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2 i.f4_1 i.dif_mobilidade i.f12_2, irr

*retirado i.f4_1 >p-valor
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2  i.dif_mobilidade i.f12_2, irr

*retirado f12_2 >p-valor
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2 i.f4_1 i.dif_mobilidade, irr

***MODELO MÚLTIPLO - PASSO 1
svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2  i.dif_mobilidade, irr


* Passo 2 - ajsutar pelas sociodemográficas (não seleciona as variáveis incluídas)

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2 i.dif_mobilidade i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc, irr

* Passo 3 - ajustar pelas sociodemográficas + comportamento e saúde (não seleciona as variáveis incluídas)

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2 i.dif_mobilidade i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas	i.AF_global	i.consumo_alcool i.consumo_tabaco	i.regularFH, irr

****HOMENS****

***Passo 1 - vizinhança p< 0,20

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.dif_mobilidade i.f5_1 i.f10_1 i.f12_2, irr

*Retirado a coesão social f12_2
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.dif_mobilidade i.f5_1 i.f10_1, irr

*Retirado a coesão social f10_1
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.dif_mobilidade i.f5_1, irr

**Modelo Final da Análise Masculino
svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.dif_mobilidade i.f5_1, irr

* Passo 2 - ajsutar pelas sociodemográficas (não seleciona as variáveis incluídas)

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.dif_mobilidade i.f5_1 i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc, irr

* Passo 3 - ajustar pelas sociodemográficas + comportamento e saúde (não seleciona as variáveis incluídas)

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.dif_mobilidade i.f5_1 i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas	i.AF_global	i.consumo_alcool i.consumo_tabaco	i.regularFH, irr

******TOTAL******

***Passo 1 - vizinhança p< 0,20
svy, subpop (if filtro==1):  poisson  AAS i.desordem2 i.f4_1 i.dif_mobilidade, irr


**Passo 2
svy, subpop (if filtro==1):  poisson  AAS i.desordem2 i.dif_mobilidade i.sexo i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc, irr

**Passo 3
svy, subpop (if filtro==1):  poisson  AAS i.desordem2 i.dif_mobilidade i.sexo i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas	i.AF_global	i.consumo_alcool i.consumo_tabaco	i.regularFH, irr

svy, subpop (if filtro==1):  poisson  AAS i.desordem2#i.sexo i.dif_mobilidade i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas	i.AF_global	i.consumo_alcool i.consumo_tabaco	i.regularFH, irr

svy, subpop (if filtro==1):  poisson  AAS i.desordem2##i.sexo i.dif_mobilidade i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas	i.AF_global	i.consumo_alcool i.consumo_tabaco	i.regularFH, irr

svy, subpop (if filtro==1 & sexo==0):  poisson  AAS i.desordem2 i.dif_mobilidade i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas	i.AF_global	i.consumo_alcool i.consumo_tabaco	i.regularFH, irr

svy, subpop (if filtro==1 & sexo==1):  poisson  AAS i.desordem2 i.dif_mobilidade i.idadeX1	i.cor i.Escolaridade	i.e7	i.Tempo_Residencia	i.moradoresX i.rendadpc i.doencas_cronicas	i.AF_global	i.consumo_alcool i.consumo_tabaco	i.regularFH, irr
