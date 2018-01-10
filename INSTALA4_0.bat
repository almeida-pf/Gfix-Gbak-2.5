mode 85,35
@echo off

: aa

msg/time:2 /w * "CARREGANDO SCRIPT... FACA BACKUP DO BANDO DE DADOS" 

echo.
echo.
echo                     PRECIONE ^<ENTER^> PARA CONTINUAR
pause>nul

:A

title @DEV - Pablo Almeida
echo.
echo                            [       15%%      ]
echo.
cecho                        {0A}圹{0F}北北北北北北北北北北北北眥\n}
ping localhost -n 2.5 >nul
cls
echo.
echo                            [       25%%      ]
echo.
cecho                        {0A}圹圹{0F}北北北北北北北北北北北眥\n}
ping localhost -n 2.5 >nul
cls
echo.
echo                            [       35%%      ]
echo.
cecho                        {0A}圹圹圹踸0F}北北北北北北北北北北{\n}
ping localhost -n 2.5 >nul
cls
echo.
echo                            [       50%%      ]
echo.
cecho                        {0A}圹圹圹圹圹圹圹圹{0F}北北北北北北北眥\n}
ping localhost -n 2.0 >nul
cls
echo.
echo                            [       75%%      ]
echo.
cecho                        {0A}圹圹圹圹圹圹圹圹圹圹{0F}北北北眥\n}
ping localhost -n 2.5 >nul
cls
echo.
echo                            [       100%%      ]
echo.
cecho                        {0A}圹圹圹圹圹圹圹圹圹圹圹圹圹踸\n}
cecho {0f} {\n}
echo.
echo.

cls
:menu
cls
color 4F

@date /t 
@time /t

echo Computador: %computername%        Usuario: %username%
                   
echo            MENU TAREFAS
echo  ====================================================
echo * 1. Gfix e Gback  2.0 / ATUALIZA VERSAO            * 
echo * 2. Gfix e Gback  2.5 / ATUALIZA VERSAO            *
echo * 3. VERIFICA ERROS BANCO 2.0                       *
echo * 4. VERIFICA ERROS BANCO 2.5                       *
echo * 5. Sair                                           *
echo * 6. Ajuda                                          * 
echo  ====================================================

set /p opcao= Escolha uma opcao:
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% GEQ 7 goto opcao7

:opcao1
cls

echo Entre com sua senha para executar Script
set /p username=master
set /p "pass=>"

if "%username%" == "master" goto acesso_negado
if NOT %pass%== masterkey  goto :opcao1

echo ==================================
echo *      Gfix e Gback 2.0          *
echo ==================================

cd..
cd..
"c:\Program Files (x86)\firebird\firebird_2_0\bin\gfix" -mend -full -ignore C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo    ***********************************************
echo    ***                                         ***
echo    ***  LEITURA DE ERROS NO BANCO!             ***
echo    ***                                         ***
echo    ***********************************************
pause
"c:\Program Files (x86)\firebird\firebird_2_0\bin\gbak" -B -G -IG -L -V C:\WINDEL\Dados\SISTEMA.FDB C:\WINDEL\Dados\SISTEMA.GBK  -user sysdba -pas masterkey"
copy "C:\WINDEL\Dados\SISTEMA.FDB" a -agDDMMYYYY "C:\WINDEL\Dados\SISTEMA_backup.FDB"
del /P /F C:\WINDEL\Dados\SISTEMA.FDB
"C:\Program Files (x86)\firebird\firebird_2_0\unins000.exe"
rd /s "C:\Program Files (x86)\firebird
call "C:\projeto_4.0_Pablo\Firebird3.0.2x32.exe"
echo.
echo.      * LEIA COM ATENCAO! *
echo.
echo.
echo.     AGUARDANDO INSTRUCAO NO SCRIPT - 
echo.
echo.     AO CLICAR EM CONTINUAR SISTEMA IRA FAZER RESTORE
echo. 
echo.     PARA VERSAO 4.0 FIREBIRD 3.0.2
echo.
echo.
pause
"c:\Program Files (x86)\firebird\firebird_3_0\gbak" -C -O -P 4096 -R -V -fix_fss_m iso8859_1 -fix_fss_d iso8859_1 C:\WINDEL\Dados\SISTEMA.GBK       C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
"C:\Program Files (x86)\winRar\WinRAR.exe" a -agDDMMYYYY  C:\WINDEL\Dados\SISTEMA_CORRIGIDO_2_0.FDB.zip  C:\WINDEL\Dados\SISTEMA.FDB
del /P /F C:\WINDEL\Dados\SISTEMA.GBK
ren C:\WINDEL\WLU.exe WLU_old.exe
copy C:\projeto_4.0_Pablo\WLU.exe C:\WINDEL\
call "C:\WINDEL\WLU.exe"

echo ==================================
echo *      Gfix e Gback 2.0          *
echo ==================================
pause
goto menu

:opcao2

cls

echo Entre com sua senha para executar Script
set /p username=master
set /p "pass=>"

if "%username%" == "master" goto acesso_negado
if NOT %pass%== masterkey  goto :opcao2

echo ==================================
echo *      Gfix e Gback 2.5          *
echo ==================================

cd..
cd..
"c:\Program Files\firebird\firebird_2_5\bin\gfix" -mend -full -ignore C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo    ***********************************************
echo    ***                                         ***
echo    ***  LEITURA DE ERROS NO BANCO!             ***
echo    ***                                         ***
echo    ***********************************************
pause
"c:\Program Files\firebird\firebird_2_5\bin\gbak" -B -G -IG -L -V C:\WINDEL\Dados\SISTEMA.FDB C:\WINDEL\Dados\SISTEMA.GBK  -user sysdba -pas masterkey"
copy "C:\WINDEL\Dados\SISTEMA.FDB" a -agDDMMYYYY "C:\WINDEL\Dados\SISTEMA_backup.FDB"
del /P /F C:\WINDEL\Dados\SISTEMA.FDB
"C:\Program Files\firebird\firebird_2_5\unins000.exe"
rd /s "c:\Program Files\Firebird"
call "C:\projeto_4.0_Pablo\Firebird3.0.2x64.exe"
echo.
echo.      * LEIA COM ATENCAO! *
echo.
echo.
echo.     AGUARDANDO INSTRUCAO NO SCRIPT - 
echo.
echo.     AO CLICAR EM CONTINUAR SISTEMA IRA FAZER RESTORE
echo. 
echo.     PARA VERSAO 4.0 FIREBIRD 3.0.2
echo.
echo.
pause
"c:\Program Files\firebird\firebird_3_0\gbak" -C -O -P 4096 -R -V -fix_fss_m iso8859_1 -fix_fss_d iso8859_1 C:\WINDEL\Dados\SISTEMA.gbk C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
"C:\Program Files (x86)\winRar\WinRAR.exe" a -agDDMMYYYY  C:\WINDEL\Dados\SISTEMA_CORRIGIDO_3_0.FDB.zip  C:\WINDEL\Dados\SISTEMA.FDB
del /P /F C:\WINDEL\Dados\SISTEMA.GBK
ren C:\WINDEL\WLU.exe WLU_old.exe
copy "C:\projeto_4.0_Pablo\WLU.exe" "C:\WINDEL\"
call "C:\WINDEL\WLU.exe"

echo ==================================
echo *      Gfix e Gback 2.5          *
echo ==================================
pause
goto menu

:opcao3
cls
echo. ==================================
echo. *      VERIFICA BANCO 2.0        *
echo. ==================================
cd..
cd..
"c:\Program Files (x86)\firebird\firebird_2_0\bin\gfix" -mend -full -ignore C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo.
echo.    ***********************************************
echo.    ***                                         ***
echo.    ***  LEITURA DE ERROS NO BANCO!             ***
echo.    ***                                         ***
echo.    ***********************************************
echo.
echo. ==================================
echo. *     VERIFICA BANCO 2.0         *
echo. ==================================
pause
goto menu

:opcao4
cls
echo.
echo. ==================================
echo. *     VERIFICA BANCO 2.5         *
echo. ==================================
cd..
cd..
"c:\Program Files\firebird\firebird_2_5\bin\gfix" -mend -full -ignore C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo.
echo.    ***********************************************
echo.    ***                                         ***
echo.    ***  LEITURA DE ERROS NO BANCO!             ***
echo.    ***                                         ***
echo.    ***********************************************
echo.
echo. ==================================
echo. *     VERIFICA BANCO 2.5         *
echo. ==================================
pause
goto menu

:opcao5
cls
exit

:opcao6
echo --------------------------------------------------------------------
echo          AJUDA DO DBREPAIR -  PABLO ALMEIDA WPF SISTEMAS.
echo ---------------------------------------------------------------------
echo.
echo.-Este programa foi concebido para funcionar em ambiente windows; 
echo.-Para melhor funcionamento o arquivo deve ser executado na pasta \bin do firebird;
echo.-Peca para todos sairem do sistema antes de executar este processo;
echo.-Nao execute em micro-computador sem no-brak para evitar "Perda Total" dos dados;
echo.-A WPF SISTEMAS NAO SE RESPONSABILIZA POR PERDA DOS DADOS GERADOS INCORRETAMENTE;
echo.
echo.
echo. PARAMETROS UTILIAZADO NO GIFIX  GBACK
echo.
echo. -B "-BACKUP_DATABASE" Gera um backup
echo.
echo. -G "-GARBAGE_COLLECT" Nao realiza o processo de garbage collection durante o processo de backup, 
echo. porem, e recomendado que voce sempre realize o garbage collect, 
echo. pois o mesmo e responsavel por excluir as versoes de registro que nao sao mais necessarias.
echo.
echo. -IG "-IGNORE" Ignora os possiveis erros de checksum
echo.
echo. -L "LIMBO" Ignora todas as transacoes que por algum motivo nao foram confirmadas e nem descartadas.
echo.
echo. -V "-VERIFY" Mostra na tela todo o processo que esta sendo executado no backup/restore
echo.
echo. -C "-CREATE_DATABASE" Cria um banco de dados a partir de um arquivo de backup ja pronto
echo.
echo. -O "-ONE_ATE_A_TIME" Durante a restauracao da base de dados sera restaurada apenas uma tabela de cada vez
echo.
echo. -P "-PAGE_SIZE" Determina o tamanho das paginas que o banco restaurado usara
echo.
echo. -R "-REPLACE_DATABASE" Especifica que caso o banco informado para o restore ja exista, ele devera ser sobreposto
echo.
echo. -I "Desativa os Indices durante o processo de restauracao do banco de Dados"
echo.
echo. -Parametros comando Del
echo.
echo. /F - Apaga arquivos de somente leitura 
echo.
echo. /S - Apaga os arquivos da pasta atual e TAMBEM das subpastas
echo.
echo. /P Pede confirmacao
echo.
pause
goto menu

:opcao7
echo. ==============================================
echo. *     OPCAO INVALIDA TENTE OUTRA OPCAO       *
echo. ==============================================
echo.
pause
goto menu

pause>nul