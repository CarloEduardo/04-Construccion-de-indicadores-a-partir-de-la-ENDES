* Project: 01. DESARROLLO INFANTIL TEMPRANO en niñas y niños menores de 6 años de edad ENDES, 2019
* Author: Carlos Eduardo Torres Garcia 
* Email: carlo.eduardo749@gmail.com
* GitHub: CarloEduardo
* Last modified: Aug 2026
********************************************************************************

clear all
set more off

global Path    = "E:\01. DataBase\01. INEI\02. ENDES"
global Dataset = "E:\07. GitHub\04-Construccion-de-indicadores-a-partir-de-la-ENDES\01. DESARROLLO INFANTIL TEMPRANO en niñas y niños menores de 6 años de edad - ENDES, 2019"

cd "$Dataset"

*      CUESTIONARIO DEL HOGAR
global Caracteristicas_Hogar           = "01. Caracteristicas del Hogar"
global Caracteristicas_Vivienda        = "02. Caracteristicas de la Vivienda"
global Programas_Sociales              = "03. Programas Sociales"
*      CUESTIONARIO INDIVIDUAL - MUJERES DE 12 A 49 AÑOS
global Datos_Basicos_MEF               = "04. Datos Basicos de MEF"
global Historia_Nacimiento             = "05. Historia de Nacimiento - Tabla de Conocimiento de Metodo"
global Embarazo_Parto_Lactancia        = "06. Embarazo, Parto, Puerperio y Lactancia"
global Inmunizacion_Salud              = "07. Inmunizacion y Salud"
global Nupcialidad_Fecundidad_Conyugue = "08. Nupcialidad - Fecundidad - Conyugue y Mujer"
global Conocimiento_Sida_Uso_Condon    = "09. Conocimiento de Sida y uso del condon"
global Mortalidad_Materna_Violencia    = "10. Mortalidad Materna - Violencia Familiar"
global Peso_Talla_Anemia               = "11. Peso y talla - Anemia"
global Disciplina_Infantil             = "12. Disciplina Infantil"
*      CUESTIONARIO DE SALUD
global Encuesta_Salud                  = "13. Encuesta de salud"

foreach x in Caracteristicas_Hogar Caracteristicas_Vivienda Programas_Sociales Datos_Basicos_MEF Historia_Nacimiento Embarazo_Parto_Lactancia Inmunizacion_Salud Nupcialidad_Fecundidad_Conyugue Conocimiento_Sida_Uso_Condon Mortalidad_Materna_Violencia Peso_Talla_Anemia Disciplina_Infantil Encuesta_Salud {
	capture mkdir "$Dataset/${`x'}"
}

********************************************************************************
* Modules:
********************************************************************************
* 1. Module	1629 – Caracteristicas del Hogar				
* 2. Module	1630 – Caracteristicas de la Vivienda				
* 3. Module	1631 – Datos Basicos de MEF				
* 4. Module	1632 – Historia de Nacimiento - Tabla de Conocimiento de Metodo				
* 5. Module	1633 – Embarazo, Parto, Puerperio y Lactancia				
* 6. Module	1634 – Inmunización y Salud				
* 7. Module	1635 – Nupcialidad - Fecundidad - Cónyugue y Mujer				
* 8. Module	1636 – Conocimiento de Sida y uso del condón				
* 9. Module	1637 – Mortalidad Materna - Violencia Familiar				
*10. Module	1638 – Peso y talla - Anemia				
*11. Module	1639 – Disciplina Infantil				
*12. Module	1640 – Encuesta de salud				
*13. Module	1641 – Programas Sociales

/*******************************************************************************
* Para usar "import spss using ..." la ruta no debe contener ninguna tilde.
* https://www.youtube.com/watch?v=f6o_HxpS7sU 

* https://www.stata.com/statalist/archive/2012-08/msg01077.html	
program Edit_Etiqueta `1'
	local i = "`1'"
	// get all variables with value labels		
	ds, has(vallabel)
	local vars `r(varlist)'
	foreach var of local vars {
		// get the name of the value label for variable `var'
		local labname : value label `var'
		// create a copy with name prefix + oldname
		label copy `labname' `i'_`labname', replace
		// assign that copy to variable `var'
		label value `var' `i'_`labname'
	}
end

*   ==> 064 Caracteristicas del Hogar
*       ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
foreach i in "RECH0" "RECH1" "RECH4" "RECHM" {                                  
	import spss using "$Path\2019\691-Modulo64\\`i'.sav", clear
		Edit_Etiqueta `i'
	save "$Path\2019\691-Modulo64\\`i'.dta", replace
}                                    
*   ==> 065 Caracteristicas de la Vivienda
*       ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
foreach i in "RECH23" {                                                         
	import spss using "$Path\2019\691-Modulo65\\`i'.sav", clear
		Edit_Etiqueta `i'	
	save "$Path\2019\691-Modulo65\\`i'.dta", replace
}                                                                               
*   ==> 066 Datos Basicos de MEF
*       ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
foreach i in "REC91" "REC0111" {
	import spss using "$Path\2019\691-Modulo66\\`i'.sav", clear
		Edit_Etiqueta `i'	
	save "$Path\2019\691-Modulo66\\`i'.dta", replace
}                                                                               
*   ==> 067 Historia de Nacimiento - Tabla de Conocimiento de Metodo
*       ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
foreach i in "RE223132" "REC21" {                                               
	import spss using "$Path\2019\691-Modulo67\\`i'.sav", clear
		Edit_Etiqueta `i'	
	save "$Path\2019\691-Modulo67\\`i'.dta", replace
}                                                                               
*   ==> 069 Embarazo, Parto, Puerperio y Lactancia
*       ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
foreach i in "REC41" "REC94" {                                                  
	import spss using "$Path\2019\691-Modulo69\\`i'.sav", clear
		Edit_Etiqueta `i'
	save "$Path\2019\691-Modulo69\\`i'.dta", replace
}                                                                               
*   ==> 070 Inmunizacion y Salud
*       ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
foreach i in "DIT" "REC42" "REC43" "REC95" {                                    
	import spss using "$Path\2019\691-Modulo70\\`i'.sav", clear
		Edit_Etiqueta `i'	
	save "$Path\2019\691-Modulo70\\`i'.dta", replace
}
*   ==> 074 Peso y talla - Anemia
*       ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
foreach i in "REC44" "RECH5" "RECH6" {                                          
	import spss using "$Path\2019\691-Modulo74\\`i'.sav", clear
		Edit_Etiqueta `i'	
	save "$Path\2019\691-Modulo74\\`i'.dta", replace
}                           
*   ==> 414 Encuesta de salud
*       ¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨
foreach i in "CSALUD01" "CSALUD08" {                                            
	import spss using "$Path\2019\691-Modulo414\\`i'.sav", clear
	if "`i'"=="CSALUD01" {
		label def labels95  9999 "ERROR"
		label def labels98  9999 "ERROR"
		label def labels101 9999 "ERROR"
		label def labels104 9999 "ERROR"		
	} 
		Edit_Etiqueta `i'	
	save "$Path\2019\691-Modulo414\\`i'.dta", replace
}                                                             
/******************************************************************************/                
123456789

*      CUESTIONARIO DEL HOGAR
global Caracteristicas_Hogar           = "01. Caracteristicas del Hogar"
global Caracteristicas_Vivienda        = "02. Caracteristicas de la Vivienda"
global Programas_Sociales              = "03. Programas Sociales"
*      CUESTIONARIO INDIVIDUAL - MUJERES DE 12 A 49 AÑOS
global Datos_Basicos_MEF               = "04. Datos Basicos de MEF"
global Historia_Nacimiento             = "05. Historia de Nacimiento - Tabla de Conocimiento de Metodo"
global Embarazo_Parto_Lactancia        = "06. Embarazo, Parto, Puerperio y Lactancia"
global Inmunizacion_Salud              = "07. Inmunizacion y Salud"
global Nupcialidad_Fecundidad_Conyugue = "08. Nupcialidad - Fecundidad - Conyugue y Mujer"
global Conocimiento_Sida_Uso_Condon    = "09. Conocimiento de Sida y uso del condon"
global Mortalidad_Materna_Violencia    = "10. Mortalidad Materna - Violencia Familiar"
global Peso_Talla_Anemia               = "11. Peso y talla - Anemia"
global Disciplina_Infantil             = "12. Disciplina Infantil"
*      CUESTIONARIO DE SALUD
global Encuesta_Salud                  = "13. Encuesta de salud"

*******************************************************************************/
use "$Path\2019\691-Modulo69\REC41.dta", clear
save "$Dataset\\$Embarazo_Parto_Lactancia\REC41.dta", replace

use "$Path\2019\691-Modulo66\REC0111.dta", clear
save "$Dataset\\$Datos_Basicos_MEF\REC0111.dta", replace

use "$Path\2019\691-Modulo67\REC21.dta", clear
save "$Dataset\\$Historia_Nacimiento\REC21.dta", replace

use "$Path\2019\691-Modulo66\REC91.dta", clear
save "$Dataset\\$Datos_Basicos_MEF\REC91.dta", replace

use "$Path\2019\691-Modulo70\DIT.dta", clear
save "$Dataset\\$Inmunizacion_Salud\DIT.dta", replace

use "$Path\2019\691-Modulo74\RECH6.dta", clear
save "$Dataset\\$Peso_Talla_Anemia\RECH6.dta", replace

						*===================================*
						*Indicador R1 : NACIMIENTO SALUDABLE*
						*===================================*
/*						
*===============================================================================*
 % DE NIÑAS Y NIÑOS MENORES DE 5 ANOS QUE NACIERON CON UN PESO >=2,500gr
 Y QUE NACIERON A PARTIR DEL NOVENO MES DE EMBARAZO
*=======================================r======================================*
*/

*Merge de BD:
use "$Dataset\\$Embarazo_Parto_Lactancia\REC41.dta", clear
merge m:1 CASEID      using "$Dataset\\$Datos_Basicos_MEF\REC0111.dta",keep(master match) keepusing(V001 V005 V022 V024 V025 V190 V012) nogen
rename MIDX BIDX
merge 1:1 CASEID BIDX using "$Dataset\\$Historia_Nacimiento\REC21.dta",keep(master match) keepusing(Q220A B4 QULT5 B16 B0)nogen
merge m:1 CASEID      using "$Dataset\\$Datos_Basicos_MEF\REC91.dta",keep(master match) keepusing(SREGION S108N S119)nogen
set more off



**********************************************************************
*Generando diseño de muestra*
g facp = V005/1000000
svyset V001 [pw=facp], strata(V022) vce(linearized) singleunit(centered)
**********************************************************************
save "rec41_3",replace

*Para Peso al nacer:
recode M19 (500/2499=0 "Menos de 2,5kg") (2500/8000=1 "Mayor o igual a 2,5kg") (else=.), gen(personac2)
lab var personac2 "Peso del recien nacido"
lab values personac2 personac2										

*Para Nacimiento a partir del noveno mes de embarazo de la madre:
recode Q220A (5/8=0 "Nacimiento antes del 9no mes")(9/10=1 "Nacimiento a partir del 9no mes") if QULT5==1 ,gen(emb36sem2)
tab emb36sem2 [iw=facp]						

**************
*Generando R1*
**************
g R1 = (personac2==1 & emb36sem2==1) if !missing(personac2)& !missing(emb36sem2)
lab define R1 1 "Mayor o igual a 2,5kg y nacieron a partir del 9no mes"  0 "Menor a 2,5kg y nacieron antes del 9no mes"
lab values R1 R1
tab R1 [iw=facp]								/*Indicador R1*/

******************************
*Generando las tablas para R1*
******************************

*Total
svy: tab R1,count obs format(%10,1f) 

*cv e intervalo
svy: tab R1,percent ci format(%3,1f) cv 

*Indicador por sexo
svy: tab B4 R1,count obs format(%10,1f) 

*Indicador por sexo con cv e intervalo
svy: tab B4 R1, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab V025 R1,count obs format(%10,1f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab V025 R1, row percent ci format(%3,1f) cv

*Indicador por región natural
svy: tab SREGION R1,count obs format(%10,1f)

* Indicador por región natural con cv e intervalo
svy: tab SREGION R1, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
recode S108N (0/1= 1 "Sin nivel/Primaria") (2=2 "Secundaria") (3/max=3 "Superior"), gen(nivel_educativo)
svy: tab nivel_educativo R1,count obs format(%10,1f)

*Indicador nivel educativo de la madre con cv e intervalo
svy: tab nivel_educativo R1, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
svy: tab V190 R1,count obs format(%10,1f)

*Indicador quintil de riqueza con cv e intervalo 
svy: tab V190 R1, row percent ci format(%3,1f) cv

*Indicador por región
svy: tab V024 R1,count obs format(%10,1f)

*Indicador por región
svy: tab V024 R1, row percent ci format(%3,1f) cv

save "R1",replace


*===========================*
							*Indicador R2 : APEGO SEGURO*
							*===========================*
							
*=====================================================================*							
* % de ninas y ninos entre 9 y 12 meses de edad que tiene una adecuada
* interacción madre hija/o como precursor del apego seguro 
*=====================================================================*

*Cruzando las bases de datos
use "$Dataset\\$Inmunizacion_Salud\DIT.dta",clear
merge m:1 CASEID      using "$Dataset\\$Datos_Basicos_MEF\REC0111.dta",keep(master match) keepusing(V001 V005 V022 V024 V025 V190 V012) nogen
merge 1:1 CASEID BIDX using "$Dataset\\$Historia_Nacimiento\REC21.dta",keep(master match) keepusing(Q220A B4 QULT5 B16 B0) nogen
merge m:1 CASEID      using "$Dataset\\$Datos_Basicos_MEF\REC91.dta"  ,keep(master match) keepusing(SREGION S108N S119) nogen

*Recodificando variables
recode QI478E7 (1=0) (2=1) (else=.), gen(e7conv)
recode QI478E8 (1=0) (2=1) (else=.), gen(e8conv)
recode QI478E9 (1=0) (2=1) (else=.), gen(e9conv)

*Generando R2*
gen R2_1 = (e7conv + e8conv + e9conv) if QI478A==0 & (QI478>=9 & QI478<=12)
lab define R2_1 0 "Retraso" 1 "Riesgo alto" 2 "Riesgo bajo" 3 "No riesgo"
lab values R2_1 R2_1 
recode R2_1 (0/2=0 "No") (3=1 "Si"), gen(R2)
lab var R2 "niñas/os 9 a 12 meses que tienen una adecuada interaccion madre hija/o como precursor de apego seguro (No riesgo)"
lab values R2 R2

**************************************************************************
* Generando el diseÃ±o de muestra*
  gen facp = V005/1000000
  svyset V001 [pw=facp], strata(V022) vce(linearized) singleunit(centered)
/*singleunit(centered):Usa la media global de la base de datos y con esto
  saca las desviaciones estandar                                             
***************************************************************************/

tab R2 [iw=facp]						/*Indicador total R2*/

******************************
*Generando las tablas para R2*
******************************

*Total
svy: tab R2,count obs format(%10,1f) 

*cv e intervalo 
svy: tab R2,percent ci format(%3,1f) cv  //EL límite superior del intervalo varía en 1 decimal

*Indicador por sexo
svy: tab B4 R2,count obs format(%10,1f) 

*Indicador por sexo con cv e intervalo
svy: tab B4 R2, row percent ci format(%3,1f) cv // Varia en decimales los estimadores

*Indicador por tipo de lugar de residencia
svy: tab V025 R2,count obs format(%10,1f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab V025 R2, row percent ci format(%3,1f) cv    // Varia en decimales los estimadores

*Indicador por región natural
svy: tab SREGION R2,count obs format(%10,1f)

*Indicador por región natural con cv e intervalo
svy: tab SREGION R2, row percent ci format(%3,1f) cv  // Varia en decimales los estimadores

*Indicador nivel educativo de la madre 
recode S108N (0/1=1 "Sin nivel/Primaria")(2=2 "Secundaria")(3/max=3 "Superior"), gen(nivel_educativo)
svy: tab nivel_educativo R2,count obs format(%10,1f)

*Indicador nivel educativo de la madre con cv e intervalo //revisar los CV E IC
svy: tab nivel_educativo R2, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
recode V190(1=1 "Quintil inferior") (2=2 "Segundo quintil") (3=3 "Quintil intermedio") (4=4 "Cuarto quintil")(5=5 "Quintil superior"),gen(v190_1)
lab var v190_1 "Quintil de riqueza"
lab values v190_1 v190_1

svy: tab v190_1 R2,count obs format(%10,1f)

*Indicador quintil de riqueza con cv e intervalo //revisar los CV E IC 
svy: tab v190_1 R2, row percent ci format(%3,1f) cv

save "dit_R2", replace


*==========================================*
							*Indicador R3 : ADECUADO ESTADO NUTRICIONAL*
							*==========================================*
							
*============================================================================*							
*% de ninas y ninos de 6 a 35 meses que se encuentran por encima de -2DE del
*puntaje Z de talla para la edad de acuerdo al estandar de la OMS y que tienen
*un nivel de hemoglobina mayor a 11g/dL.
*============================================================================*

*Convirtiendo las variables string a numÃ©ricas y renombrando las variables identificadoras:

use "$Dataset\\$Peso_Talla_Anemia\RECH6.dta",clear
ren _all,lower
g persona = hc0
sort hhid persona
save "rech6_1",replace

use "rech1",clear
ren _all,lower
g persona = hvidx
sort hhid persona
save "rech1_1",replace

use "rech0",clear
ren _all,lower
sort hhid
save "rech0_1",replace


*===============================================================
u "rech6_1",clear
sort hhid
merge m:1 hhid using "rech0_1",keep(master match) keepusing(hv005 hv001 hv022 hv040 hv042 hv025) nogen
sort hhid
merge m:1 hhid using "rech23",keep(master match) keepusing(shregion hv270)nogen
sort hhid persona
merge 1:1 hhid persona using "rech1_1",keep(master match) keepusing(hv103) nogen


/************************************************************************
 Generando diseñoo de muestra*/
 gen facp = hv005/1000000
 svyset hv001 [iw=facp], strata(hv022)vce(linearized)singleunit(certainty)
**************************************************************************/
*--------------------------------------------------*
* Para DCI en niñas/os menores de 35 meses de edad *
*--------------------------------------------------*
gen desnwho2 = .
replace desnwho2 = 0 if ((hc70 < -200) & hv103==1 & hc1<=35)     // Con desnutrición
replace desnwho2 = 1 if ((hc70 >= -200 & hc70<601) & hv103==1 & hc1<=35)    // Sin desnutricón
lab var desnwho2 "% de Niñas/os menor a 3 años de edad con Desnutrición Crónica"
lab define desnwho2 1 "Sin Desnutrición Crónica" 0 "Con Desnutrición Crónica"
lab values desnwho2 desnwho2
tab desnwho2 [iw=facp]    // Los resultados 2019 consideran niñas/os menores a 35 meses

*-------------------------------------------------*
* Para anemia en niñas/os de 6 a 35 meses de edad *
*-------------------------------------------------*
recode hc57 (1/3 = 0 "Anemia") (4 = 1 "Sin anemia")(9=.) if hv042 == 1 & hc1 >= 6 & hc1 <= 35 & hc55 == 0 & hv103 == 1, gen(anemia) label(anemia)
lab var anemia "anemia en niñas/os de 6 a 35 meses de edad"
lab values anemia anemia

*----------------------------------*
* Para Adecuado estado nutricional *
*----------------------------------*
g desn_anem = (desnwho2==1 & anemia==1) & (hc1>=6 & hc1<=35) if (!missing(desnwho2) & !missing(anemia))
lab var desn_anem "Adecuado estado nutricional"
lab define desn_anem 1 "Sin desnutrición y sin Anemia" 0 "Con desnutricion y/o con Anemia"
lab values desn_anem desn_anem

tab desn_anem [iw=facp] 				     // Indicador R3

******************************
*Generando las tablas para R3*
******************************

*Total
svy: tab desn_anem ,count obs format(%10,1f) 

*cv e intervalo
svy: tab desn_anem ,percent ci format(%10,1f) cv 		

*Indicador por sexo 
svy: tab hc27 desn_anem,count obs format(%10,1f) 

*Indicador por sexo con cv e intervalo
svy: tab hc27 desn_anem, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab hv025 desn_anem,count obs format(%10,1f) 

*Indicador por tipo de lugar de residencia con cv e intervalo //IC varían en decimales
svy: tab hv025 desn_anem, row percent ci format(%3,1f) cv

*Indicador por región natural
svy: tab shregion desn_anem,count obs format(%10,1f)

*Indicador por regiÃ³n natural con cv e intervalo 
svy: tab shregion desn_anem, row percent ci format(%3,1f) cv

*No coincide con el total producto de que no se considera los missings(No contesto la pregunta)
*Indicador nivel educativo de la madre
recode hc61 (0/1=1 "Sin nivel/Primaria" )(2=2 "Secundaria")(3=3 "Superior")(9=4 "No sabe"),gen(nivel_educativo)
lab var nivel_educativo "Nivel de educación de la madre"
lab values nivel_educativo nivel_educativo

svy: tab nivel_educativo desn_anem,count obs format(%10,1f)

*Indicador nivel educativo de la madre con cv e intervalo
svy: tab nivel_educativo desn_anem, row percent ci format(%3,1f) cv

*Indicador Quintil de riqueza
recode hv270 (1=0 "Quintil inferior")(2=1 "Segundo quintil")(3=2 "Quintil intermedio")(4=3 "Cuarto quintil")(5=4 "Quintil superior"),gen(hv270_2)
lab var hv270_2 "Quintil de riqueza"
lab values hv270_2 hv270_2

svy: tab hv270_2 desn_anem,count obs format(%10,1f)

*Indicador Quintil de riqueza con cv e intervalo  //IC varían en decimales
svy: tab hv270_2 desn_anem, row percent ci format(%3,1f) cv
save "rech6_R3",replace

*===========================================*
					*Indicador R4 : COMUNICACION VERBAL EFECTIVA*
					*===========================================*
										
*====================================================================*					
* % de niñas y niños de 9 a 36 meses con comunicación verbal a nivel 
* comprensivo y expresivo apropiada para su edad.
*====================================================================*
*=====================*
* Tramo 1: 9-12 meses *
*=====================*

** Merge datasets :

use "$Dataset\\$Inmunizacion_Salud\DIT.dta",clear 
merge m:1 CASEID      using "$Dataset\\$Datos_Basicos_MEF\REC0111.dta",keep(master match)keepusing(v001 v005 v022 v025 v149 v190 v024 v012) nogen
merge 1:1 CASEID BIDX using "$Dataset\\$Historia_Nacimiento\REC21.dta",keep(master match)keepusing(b4)nogen
merge m:1 CASEID      using "$Dataset\\$Datos_Basicos_MEF\REC91.dta",keep(master match)keepusing(sregion)nogen

** Indicador :
recode qi478e3 (1=1) (2=0) (else=.), gen(e3conv)
recode qi478e4 (1=1) (2=0) (else=.), gen(e4conv)
recode qi478e5 (1=1) (2=0) (else=.), gen(e5conv)

gen e345 = e3conv + e4conv + e5conv if (qi478a==0 & (qi478>=9 & qi478<=12))
lab define e345 0 "Retraso" 1 "Riesgo alto" 2 "Riesgo bajo" 3 "No riesgo"
lab values e345 e345

recode e345 (0/2=0 "No")(3=1 "Si"), gen(R4_9_12m)
lab var R4_9_12m "niñas/os 9 a 12 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad (No riesgo)"
lab values R4_9_12m R4_9_12m

*************************************************************************
*Generando el diseño de muestra*
gen facp = v005/1000000
svyset v001 [pw=facp], strata(v022) vce(linearized) singleunit(centered)
**singleunit(centered):Usa la media global de la base de datos y con esto
/// saca las desviaciones estandar
**************************************************************************

tab R4_9_12m [iw=facp]		/*INDICADOR ES EL PORCENTAJE DE "No riesgo"*/

************************************
*Generando las tablas para R4_9_12m*
************************************

*Total
svy: tab R4_9_12m,count obs format(%10,1f) 

*cv e intervalo
svy: tab R4_9_12m,percent ci format(%3,1f) cv 

*Indicador por sexo
svy: tab b4 R4_9_12m,count obs format(%10,0f) 

*Indicador por sexo con cv e intervalo
svy: tab b4 R4_9_12m,row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab v025 R4_9_12m,count obs format(%10,0f) 

*Indicador por tipo de lugar de residencia 
svy: tab v025 R4_9_12m, row percent ci format(%3,1f) cv

*Indicador por regiÃ³n natural
svy: tab sregion R4_9_12m,count obs format(%10,0f)

*Indicador por regiÃ³n natural 
svy: tab sregion R4_9_12m, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
recode v149 (0/2= 1 "Sin nivel/Primaria") (3/4=2 "Secundaria") (5/max=3 "Superior"), gen(nivel_educativo)
svy: tab nivel_educativo R4_9_12m,count obs format(%10,0f)

*Indicador nivel educativo de la madre con cv e intervalo
svy: tab nivel_educativo R4_9_12m, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
recode v190(1=1 "Quintil inferior")(2=2 "Segundo quintil")(3=3 "Quintil intermedio")(4=4 "Cuarto quintil")(5=5 "Quintil superior"),gen(v190_1)
lab var v190_1 "Quintil de riqueza" 
lab values v190_1 v190_1
svy: tab v190_1 R4_9_12m,count obs format(%10,0f)

*Indicador quintil de riqueza con cv e intervalo 
svy: tab v190_1 R4_9_12m, row percent ci format(%3,1f) cv

*===============================================================================================
*======================*
* Tramo 2: 13-18 meses *
*======================*

** Merge datasets :

u "dit",clear 
	sort caseid
		merge m:1 caseid using "rec0111",keep(master match)keepusing(v001 v005 v022 v025 v149 v190 v024 v012) nogen
	sort caseid bidx
		merge 1:1 caseid bidx using "rec21",keep(master match)keepusing(b4)nogen
	sort caseid
		merge m:1 caseid using "rec91",keep(master match)keepusing(sregion)nogen
		
** Indicador :		
recode qi478f3 (1=1) (2=0) (else=.), gen(f3conv)
recode qi478f4 (1=1) (2=0) (else=.), gen(f4conv)
recode qi478f5 (1=1) (2=0) (else=.), gen(f5conv)

gen f345 = f3conv + f4conv + f5conv if (qi478a==0 & (qi478>=13 & qi478<=18))
lab define f345 0 "Retraso" 1 "Riesgo alto" 2 "Riesgo bajo" 3 "No riesgo"
lab values f345 f345

recode f345 (0/2=0 "No") (3=1 "Si"), gen(R4_13_18m)
lab var R4_13_18m "niñas/os 13 a 18 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad (No riesgo)"
lab values R4_13_18m R4_13_18m

**********************************************************************
*Generando el diseño de muestra*
gen facp = v005/1000000
svyset v001 [pw=facp], strata(v022) vce(linearized) singleunit(centered)
**********************************************************************

tab R4_13_18m [iw=facp]     	/*INDICADOR ES EL PORCENTAJE DE "No riesgo"*/       	                

***************************************
* Generando las tablas para R4_13_18m *
***************************************

*Total
svy: tab R4_13_18m, count obs format(%10,0f) 

*cv e intervalo
svy: tab R4_13_18m, percent ci format(%3,1f) cv 

*Indicador por sexo
svy: tab b4 R4_13_18m,count obs format(%10,0f) 

*Indicador por sexo con cv e intervalo
svy: tab b4 R4_13_18m, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab v025 R4_13_18m,count obs format(%10,0f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab v025 R4_13_18m, row percent ci format(%3,1f) cv

*Indicador por regiÃ³n natural
svy: tab sregion R4_13_18m,count obs format(%10,0f)

*Indicador por regiÃ³n natural con cv e intervalo 
svy: tab sregion R4_13_18m, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
recode v149 (0/2= 1 "Sin nivel/Primaria") (3/4=2 "Secundaria") (5/max=3 "Superior"), gen(nivel_educativo)
svy: tab nivel_educativo R4_13_18m,count obs format(%10,0f)

*Indicador nivel educativo de la madre con cv e intervalo 
svy: tab nivel_educativo R4_13_18m, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
recode v190(1=1 "Quintil inferior")(2=2 "Segundo quintil")(3=3 "Quintil intermedio")(4=4 "Cuarto quintil")(5=5 "Quintil superior"),gen(v190_1)
lab var v190_1 "Quintil de riqueza" 
lab values v190_1 v190_1
svy: tab v190_1 R4_13_18m,count obs format(%10,0f)

*Indicador quintil de riqueza con cv e intervalo 
svy: tab v190_1 R4_13_18m, row percent ci format(%3,1f) cv

*===============================================================================================
*=====================
*Tramo3: 19-23 meses
*=====================
recode qi478g1 	 (1=1) (2=0) (else=.), gen(g1conv)
recode qi478g2_a (1=1) (2=0) (else=.), gen(g2aconv)
recode qi478g2_b (1=1) (2=0) (else=.), gen(g2bconv)
recode qi478g2_c (1=1) (2=0) (else=.), gen(g2cconv)
recode qi478g3   (1=1) (2=0) (else=.), gen(g3conv)

gen g2abc = (g2aconv+g2bconv+g2cconv)/3
gen g345 = int(g1conv+g2abc+g3conv)
lab define g345 0 "Retraso" 1 "Riesgo alto" 2 "Riesgo bajo" 3 "No riesgo"
lab values g345 g345

recode g345 (0/2=0 "No") (3=1 "Si") if (qi478a==0 & (qi478>=19 & qi478<=23)), gen(R4_19_23m) 
lab var R4_19_23m "niñas/os 19 a 23 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad (No riesgo)"
lab values R4_19_23m R4_19_23m

tab R4_19_23m [iw=facp]					/*INDICADOR ES EL PORCENTAJE DE "No riesgo"*/ 

*************************************
*Generando las tablas para R4_19_23m*
*************************************

*Total
svy: tab R4_19_23m, count obs format(%10,0f) 

*cv e intervalo
svy: tab R4_19_23m, percent ci format(%3,1f) cv 

*Indicador por sexo
svy: tab b4 R4_19_23m,count obs format(%10,0f) 

*Indicador por sexo con cv e intervalo
svy: tab b4 R4_19_23m, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab v025 R4_19_23m,count obs format(%10,0f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab v025 R4_19_23m, row percent ci format(%3,1f) cv

*Indicador por regiÃ³n natural
svy: tab sregion R4_19_23m,count obs format(%10,0f)

*Indicador por regiÃ³n natural con cv e intervalo 
svy: tab sregion R4_19_23m, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
svy: tab nivel_educativo R4_19_23m,count obs format(%10,0f)

*Indicador nivel educativo de la madre con cv e intervalo 
svy: tab nivel_educativo R4_19_23m, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
svy: tab v190_1 R4_19_23m,count obs format(%10,0f)

*Indicador quintil de riqueza con cv e intervalo //revisar los CV E IC 
svy: tab v190_1 R4_19_23m, row percent ci format(%3,1f) cv

*=============================================================================================*
*====================
*Tramo4: 24-36 meses
*====================
recode qi478h1 (1=1) (2=0) (else=.), gen(h1conv)
recode qi478h2 (1=1) (2=0) (else=.), gen(h2conv)
recode qi478h3 (1=1) (2=0) (else=.), gen(h3conv)

gen h345 = h1conv + h2conv + h3conv if (qi478a==0 & (qi478>=24 & qi478<=36))
lab define h345 0 "Retraso" 1 "Riesgo alto" 2 "Riesgo bajo" 3 "No riesgo"
lab values h345 h345

recode h345 (0/2=0 "No") (3=1 "Si"), gen(R4_24_36m)
lab var R4_24_36m "ninas(o) 24 a 36 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad (No riesgo)"
lab values R4_24_36m R4_24_36m

tab R4_24_36m [iw=facp]		 /*INDICADOR ES EL % DE "No riesgo"*/ 

**************************************
*Generando las tablas para R4_24_36m*
**************************************

*Total
svy: tab R4_24_36m, count obs format(%10,0f) 

*cv e intervalo
svy: tab R4_24_36m, percent ci format(%3,1f) cv 

*Indicador por sexo
svy: tab b4 R4_24_36m,count obs format(%10,0f) 

*Indicador por sexo con cv e intervalo
svy: tab b4 R4_24_36m, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab v025 R4_24_36m,count obs format(%10,0f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab v025 R4_24_36m, row percent ci format(%3,1f) cv

*Indicador por regiÃ³n natural
svy: tab sregion R4_24_36m,count obs format(%10,0f)

*Indicador por regiÃ³n natural con cv e intervalo 
svy: tab sregion R4_24_36m, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
svy: tab nivel_educativo R4_24_36m,count obs format(%10,0f)

*Indicador nivel educativo de la madre con cv e intervalo 
svy: tab nivel_educativo R4_24_36m, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
svy: tab v190_1 R4_24_36m,count obs format(%10,0f)

*Indicador quintil de riqueza con cv e intervalo 
svy: tab v190_1 R4_24_36m, row percent ci format(%3,1f) cv

*====================================================================*
*============================
*Para el indicador global R4
*============================
*====================================================================*
* % de niñas y niños de 9 a 36 meses con comunicacion verbal a nivel 
* comprensivo y expresivo apropiada para su edad.
*====================================================================*

** Merge datasets :
u "dit",clear 
	sort caseid
		merge m:1 caseid using "rec0111",keep(master match)keepusing(v001 v005 v022 v025 v149 v190 v024 v012) nogen
	sort caseid bidx
		merge 1:1 caseid bidx using "rec21",keep(master match)keepusing(b4)nogen
	sort caseid
		merge m:1 caseid using "rec91",keep(master match)keepusing(sregion s119 s108n)nogen

** Indicador :

recode qi478e3 (1=1)(2=0)(else=.), gen(e3conv)
recode qi478e4 (1=1)(2=0)(else=.), gen(e4conv)
recode qi478e5 (1=1)(2=0)(else=.), gen(e5conv)
gen e345 = e3conv + e4conv + e5conv if (qi478a==0 & (qi478>=9 & qi478<=12))

recode e345 (0/2=0 "No") (3=1 "Si"), gen(R4_9_12m)
lab var R4_9_12m "ninas(o) 9 a 12 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad (No riesgo)"
lab values R4_9_12m R4_9_12m

recode qi478f3 (1=1) (2=0) (else=.), gen(f3conv)
recode qi478f4 (1=1) (2=0) (else=.), gen(f4conv)
recode qi478f5 (1=1) (2=0) (else=.), gen(f5conv)
gen f345 = f3conv + f4conv + f5conv if (qi478a==0 & (qi478>=13 & qi478<=18))

recode f345 (0/2=0 "No") (3=1 "Si"), gen(R4_13_18m)
lab var R4_13_18m "ninas(o) 13 a 18 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad (No riesgo)"
lab values R4_13_18m R4_13_18m

recode qi478g1 	 (1=1) (2=0) (else=.), gen(g1conv)
recode qi478g2_a (1=1) (2=0) (else=.), gen(g2aconv)
recode qi478g2_b (1=1) (2=0) (else=.), gen(g2bconv)
recode qi478g2_c (1=1) (2=0) (else=.), gen(g2cconv)
recode qi478g3   (1=1) (2=0) (else=.), gen(g3conv)
gen g2abc = ((g2aconv + g2bconv + g2cconv)/3)
gen g345  = int(g1conv + g2abc + g3conv)

recode g345 (0/2=0 "No") (3=1 "Si") if (qi478a==0 & (qi478>=19 & qi478<=23)), gen(R4_19_23m) 
lab var R4_19_23m "ninas(o) 19 a 23 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad (No riesgo)"
lab values R4_19_23m R4_19_23m

recode qi478h1 (1=1) (2=0) (else=.), gen(h1conv)
recode qi478h2 (1=1) (2=0) (else=.), gen(h2conv)
recode qi478h3 (1=1) (2=0) (else=.), gen(h3conv)
gen h345 = h1conv + h2conv + h3conv if (qi478a==0 & (qi478>=24 & qi478<=36))

recode h345 (0/2=0 "No") (3=1 "Si"), gen(R4_24_36m)
lab var R4_24_36m "ninas(o) 24 a 36 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad (No riesgo)"
lab values R4_24_36m R4_24_36m

* Para el R4 
egen R4 = rowtotal(R4_9_12m R4_13_18m R4_19_23m R4_24_36m) if !missing(R4_9_12m) | !missing(R4_13_18m) | !missing(R4_19_23m) | !missing(R4_24_36m)

lab var R4 "niñas/os 9 a 36 meses con comunicacion verbal a nivel comprensivo y expresivo apropiada para su edad"
lab define R4 1 "Si" 0 "No"
lab values R4 R4

**********************************************************************
*Generando el diseÃ±o de muestra*
gen facp = v005/1000000
svyset v001 [pw=facp], strata(v022) vce(linearized) singleunit(centered)
**********************************************************************

tab R4 [iw=facp]			/*Indicador R4*/

******************************
*Generando las tablas para R4*
******************************

*Total
svy: tab R4, count obs format(%10,0f) 

*cv e intervalo
svy: tab R4, percent ci format(%4,1f) cv 

*Indicador por sexo
svy: tab b4 R4,count obs format(%10,0f) 

*Indicador por sexo con cv e intervalo
svy: tab b4 R4, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab v025 R4,count obs format(%10,0f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab v025 R4, row percent ci format(%3,1f) cv

*Indicador por regiÃ³n natural
svy: tab sregion R4,count obs format(%10,0f)

*Indicador por regiÃ³n natural con cv e intervalo 
svy: tab sregion R4, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
recode v149 (0/2= 1 "Sin nivel/Primaria") (3/4=2 "Secundaria") (5/max=3 "Superior"), gen(nivel_educativo)
svy: tab nivel_educativo R4,count obs format(%10,0f)

*Indicador nivel educativo de la madre con cv e intervalo 
svy: tab nivel_educativo R4, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
recode v190(1=1 "Quintil inferior")(2=2 "Segundo quintil")(3=3 "Quintil intermedio")(4=4 "Cuarto quintil")(5=5 "Quintil superior"),gen(v190_1)
lab var v190_1 "Quintil de riqueza"
lab values v190_1 v190_1
svy: tab v190_1 R4,count obs format(%10,0f)

*Indicador quintil de riqueza con cv e intervalo 
svy: tab v190_1 R4, row percent ci format(%3,1f) cv

save "dit_R4",replace

*===========================
										*Indicador R5 : CAMINA SOLO*
										*===========================
										
*====================================================================										
*% de ninas y ninos de 12 a 18 meses que camina por propia iniciativa 
*sin necesidad de detenerse para lograr el equilibrio
*====================================================================

** Merge datasets :
u "dit",clear 
	sort caseid
		merge m:1 caseid using "rec0111",keep(master match)keepusing(v001 v005 v022 v025 v149 v190 v024 v012) nogen
	sort caseid bidx
		merge 1:1 caseid bidx using "rec21",keep(master match)keepusing(b4)nogen
	sort caseid
		merge m:1 caseid using "rec91",keep(master match)keepusing(sregion s119 s108n)nogen

** Indicador :

recode qi478e1 (1/5=0)(6=1)(else=.)if (qi478a==0 & qi478==12), gen(e1conv)
recode qi478f1 (1/4=0)(5/6=1) if (qi478a==0 & (qi478>=13 & qi478<=18)),gen(f1conv)

egen R5 = rowtotal(e1conv f1conv) if !missing(e1conv)|!missing(f1conv)
lab var R5 "niñas/os de 12 a 18 meses que camina por propia iniciativa sin necesidad de detenerse para lograr el equilibrio"
lab define R5 0 "Retraso" 1 "No riesgo"
lab values R5 R5

*****************************************************************************
*Generando el diseño de muestra*
gen facp = v005/1000000
svyset v001 [pw=facp], strata(v022) vce(linearized) singleunit(centered)
**singleunit(centered):Usa la media global de la base de datos y con esto
/// saca las desviaciones estandar 
*****************************************************************************

tab R5 [iw=facp]	/***INDICADOR ES EL PORCENTAJE DE "No riesgo"*/

******************************
*Generando las tablas para R5*
******************************

*Total
svy: tab R5,count obs format(%10,1f) 

*cv e intervalo
svy: tab R5,percent ci format(%3,1f) cv 

*Indicador por sexo
svy: tab b4 R5,count obs format(%10,1f) 

*Indicador por sexo con cv e intervalo
svy: tab b4 R5, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab v025 R5,count obs format(%10,1f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab v025 R5, row percent ci format(%3,1f) cv

*Indicador por regiÃ³n natural
svy: tab sregion R5,count obs format(%10,1f)

*Indicador por regiÃ³n natural con cv e intervalo
svy: tab sregion R5, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
recode v149 (0/2= 1 "Sin nivel/Primaria") (3/4=2 "Secundaria") (5/max=3 "Superior"), gen(nivel_educativo)
svy: tab nivel_educativo R5,count obs format(%10,1f)

*Indicador nivel educativo de la madre con cv e intervalo
svy: tab nivel_educativo R5, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
recode v190 (1=1 "Quintil inferior")(2=2 "Segundo quintil")(3=3 "Quintil intermedio")(4=4 "Cuarto quintil")(5=5 "Quintil superior"),gen(v190_1)
lab var v190_1 "Quintil de riqueza"
lab values v190_1 v190_1
svy: tab v190_1 R5,count obs format(%10,1f)

*Indicador quintil de riqueza con cv e intervalo //revisar los CV E IC 
svy: tab v190_1 R5, row percent ci format(%3,1f) cv
save "dit_R5",replace

*===========================================================*
					*Indicador R6 : REGULACION DE EMOCIONES Y DEL COMPORTAMIENTO*
					*===========================================================*
					
*==========================================================================*
*% de ninas y ninos DE 24 a 71 meses que regula sus emociones y 
*comportamientos en situaciones de frustracion y establecimiento de limites
*==========================================================================*

** Merge datasets :
u "dit",clear 
	sort caseid
		merge m:1 caseid using "rec0111",keep(master match)keepusing(v001 v005 v022 v025 v149 v190 v024 v012) nogen
	sort caseid bidx
		merge 1:1 caseid bidx using "rec21",keep(master match)keepusing(b4)nogen
	sort caseid
		merge m:1 caseid using "rec91",keep(master match)keepusing(sregion s119 s108n)nogen

** Indicador :
egen h9i5j5  = rowtotal(qi478h9 qi478i5 qi478j5)
egen h10i6j6 = rowtotal(qi478h10 qi478i6 qi478j6)
egen h11i7j7 = rowtotal(qi478h11 qi478i7 qi478j7)

recode h9i5j5 (1=0)(2=1)(else=.),gen(h9i5j5conv)
recode h11i7j7(1=0)(2=1)(else=.),gen(h11i7j7conv)
recode h10i6j6 (1=1)(2=0)(3=0)(else=.),gen (h10i6j6conv)

gen R6_1=(h9i5j5conv + h10i6j6conv + h11i7j7conv) if (qi478a==0 & (qi478>=24 & qi478<=71))
lab define R6_1 0 "Retraso"  1 "Riesgo alto"  2 "Riesgo bajo"  3 "No riesgo"

recode R6_1 (0/2=0 "No")(3=1 "Si")(else=.),gen(R6)
lab var R6 "ninas(o) 24 a 71 meses que regula sus emociones y comportamientos en situaciones de frustracion y establecimiento de limites"
lab values R6 R6

**************************************************************************
*Generando el diseÃ±o de muestra*
gen facp = v005/1000000
svyset v001 [pw=facp], strata(v022) vce(linearized) singleunit(centered)
**singleunit(centered):Usa la media global de la base de datos y con esto
/// saca las desviaciones estandar
**************************************************************************

tab R6 [iw=facp]			/*INDICADOR ES EL PORCENTAJE DE "No riesgo*/

******************************
*Generando las tablas para R6*
******************************
*Total
svy: tab R6, count obs format(%10,1f) 

*cv e intervalo
svy: tab R6, percent ci format(%4,1f) cv 

*Indicador por sexo
svy: tab b4 R6,count obs format(%10,1f) 

*Indicador por sexo con cv e intervalo
svy: tab b4 R6, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab v025 R6,count obs format(%10,1f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab v025 R6, row percent ci format(%3,1f) cv

*Indicador por regiÃ³n natural
svy: tab sregion R6,count obs format(%10,1f)

*Indicador por regiÃ³n natural con cv e intervalo 
svy: tab sregion R6, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
recode v149 (0/2= 1 "Sin nivel/Primaria") (3/4=2 "Secundaria") (5/max=3 "Superior"), gen(nivel_educativo)
svy: tab nivel_educativo R6,count obs format(%10,1f)

*Indicador nivel educativo de la madre con cv e intervalo 
svy: tab nivel_educativo R6, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
recode v190(1=1 "Quintil inferior")(2=2 "Segundo quintil")(3=3 "Quintil intermedio")(4=4 "Cuarto quintil")(5=5 "Quintil superior"),gen(v190_1)
lab var v190_1 "Quintil de riqueza"
lab values v190_1 v190_1
svy: tab v190_1 R6,count obs format(%10,1f)

*Indicador quintil de riqueza con cv e intervalo 
svy: tab v190_1 R6, row percent ci format(%3,1f) cv

save "dit_R6",replace

*================================*
							*Indicador R7 : FUNCION SIMBOLICA*
							*================================*
							
*==============================================================*							
*% de ninas y ninos de 24 a 36 meses de edad que representa sus 
*vivencias a través del juego y el dibujo
*==============================================================*	

** Merge datasets :

u "dit",clear 
	sort caseid
		merge m:1 caseid using "rec0111",keep(master match)keepusing(v001 v005 v022 v025 v149 v190 v024 v012) nogen
	sort caseid bidx
		merge 1:1 caseid bidx using "rec21",keep(master match)keepusing(b4)nogen
	sort caseid
		merge m:1 caseid using "rec91",keep(master match)keepusing(sregion s119 s108n)nogen

** Indicador :

recode qi478h5 (1=1)(2=0)(else=.) ,gen(h5conv)
recode qi478h6 (1=1)(2=0)(else=.) ,gen(h6conv)
recode qi478h7 (1=1)(2=0)(else=.) ,gen(h7conv)

gen R7_1 = (h5conv + h6conv + h7conv) if (qi478a==0 & (qi478>=24 & qi478 <= 36 ))
lab define R7_1 0 "Retraso" 1 "Riesgo alto" 2 "Riesgo bajo" 3 "No riesgo"

recode R7_1 (0/2=0 "No")(3=1 "Si") ,gen (R7_24_36m)
lab var R7_24_36m "ninos(a) 24 a 36 meses de edad que representa sus vivencias a travÃƒÂ©s del juego y el dibujo"
lab values R7_24_36m R7_24_36m

**************************************************************************
*Generando el diseÃ±o de muestra*
gen facp = v005/1000000
svyset v001 [pw=facp], strata(v022) vce(linearized) singleunit(centered)
**************************************************************************

tab R7_24_36m [iw=facp] 			/*Indicador total R7_24_36m*/

*************************************
*Generando las tablas para R7_24_36m*
*************************************
*Total
svy: tab R7_24_36m,count obs format(%10,1f) 

*cv e intervalo (Varía en decimales los ICF)
svy: tab R7_24_36m,percent ci format(%3,2f) cv 

*Indicador por sexo
svy: tab b4 R7_24_36m,count obs format(%10,1f) 

*Indicador por sexo con cv e intervalo
svy: tab b4 R7_24_36m, row percent ci format(%3,1f) cv

*Indicador por tipo de lugar de residencia
svy: tab v025 R7_24_36m,count obs format(%10,1f) 

*Indicador por tipo de lugar de residencia con cv e intervalo
svy: tab v025 R7_24_36m, row percent ci format(%3,1f) cv

*Indicador por regiÃ³n natural
svy: tab sregion R7_24_36m,count obs format(%10,1f)

*Indicador por regiÃ³n natural con cv e intervalo
svy: tab sregion R7_24_36m, row percent ci format(%3,1f) cv

*Indicador nivel educativo de la madre
recode v149 (0/2= 1 "Sin nivel/Primaria") (3/4=2 "Secundaria") (5/max=3 "Superior"), gen(nivel_educativo)
svy: tab nivel_educativo R7_24_36m,count obs format(%10,1f)

*Indicador nivel educativo de la madre con cv e intervalo
svy: tab nivel_educativo R7_24_36m, row percent ci format(%3,1f) cv

*Indicador quintil de riqueza
recode v190(1=1 "Quintil inferior")(2=2 "Segundo quintil")(3=3 "Quintil intermedio")(4=4 "Cuarto quintil")(5=5 "Quintil superior"),gen(v190_1)
lab var v190_1 "Quintil de riqueza"
lab values v190_1 v190_1
svy: tab v190_1 R7_24_36m,count obs format(%10,1f)

*Indicador quintil de riqueza con cv e intervalo
svy: tab v190_1 R7_24_36m, row percent ci format(%3,1f) cv
save "dit_R7",replace