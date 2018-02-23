mode 85,35
@echo off

: aa

msg/time:3 /w * "CARREGANDO SCRIPT... EXECUTE COMO ADMINISTRADOR" 


:A

title @DEV - Pablo Almeida / @DEV - WELLITON

color 4F


REM abaixo temos o IF para identificar qual a estrutura do computador;
IF EXIST "C:\Windows\SysWOW64" (
set instala_firebird="C:\projeto_4.0_Pablo\Firebird3.0.2x64.exe"
set fb3="C:\Program Files\Firebird\Firebird_3_0\
) else (
set instala_firebird="C:\projeto_4.0_Pablo\Firebird3.0.2x32.exe"
IF EXIST "C:\Program Files (x86)" (
set fb3="C:\Program Files (x86)\Firebird\Firebird_3_0\
) else (
set fb3="C:\Program Files\Firebird\Firebird_3_0\
)
)
REM abaixo temos o IF para identificar qual winrar esta instalado;
IF EXIST "C:\Program Files\WinRAR" (
set winrar="C:\Program Files\WinRAR\WinRAR.exe"
) else (
set winrar="C:\Program Files (x86)\WinRAR\WinRAR.exe"
)

REM abaixo temos o IF para identificar qual firebird esta instalado;
IF EXIST "C:\Program Files\Firebird\Firebird_2_5" ( 
set fb_instalado="c:\Program Files\firebird\firebird_2_5\
set windel=C:\WINDEL\
set clear_fb="c:\Program Files\firebird\"
)
IF EXIST "C:\Program Files (x86)\Firebird\Firebird_2_5" (
set fb_instalado="c:\Program Files (x86)\firebird\firebird_2_5\
set windel=C:\WINDEL\
set clear_fb="c:\Program Files (x86)\firebird\"
)
IF EXIST "C:\Program Files\Firebird\Firebird_2_0" (
set fb_instalado="c:\Program Files\firebird\firebird_2_0\
set windel=localhost:C:\WINDEL\
set clear_fb="c:\Program Files\firebird\"
)
IF EXIST "C:\Program Files (x86)\Firebird\Firebird_2_0" (
set fb_instalado="c:\Program Files (x86)\firebird\firebird_2_0\
set windel=localhost:C:\WINDEL\
set clear_fb="c:\Program Files (x86)\firebird\"
)
IF EXIST "C:\Program Files\Firebird\Firebird_3_0" (
set fb_instalado="c:\Program Files\firebird\firebird_3_0\
set windel=C:\WINDEL\
set clear_fb="c:\Program Files\firebird\"
)
IF EXIST "C:\Program Files (x86)\Firebird\Firebird_3_0" (
set fb_instalado="c:\Program Files (x86)\firebird\firebird_3_0\
set windel=C:\WINDEL\
set clear_fb="c:\Program Files (x86)\firebird\"
)


echo Computador: %computername%        Usuario: %username%
                   
echo            MENU TAREFAS
echo  ====================================================
echo * 1. Gfix e Gback ATUALIZA VERSAO                   * 
echo * 2. Gfix e Gback  2.0 / 2.5 CORRECAO               *
echo * 3. VERIFICA ERROS BANCO DESATIVADO                *
echo * 4. VERIFICA ERROS BANCO DESATIVADO                *
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


echo ==================================
echo *         Gfix e Gback  / INICIO *
echo ==================================

cd..
cd..
%fb_instalado%bin\gfix" -mend -full -ignore %windel%Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo    ***********************************************
echo    ***                                         ***
echo    ***  LEITURA DE ERROS NO BANCO!             ***
echo    ***                                         ***
echo    ***********************************************
pause
%fb_instalado%bin\gbak" -B -G -IG -L -V %windel%Dados\SISTEMA.FDB C:\WINDEL\Dados\SISTEMA.GBK  -user sysdba -pas masterkey"
copy "C:\WINDEL\Dados\SISTEMA.FDB" "C:\WINDEL\Dados\SISTEMA_BACKUP.FDB"
del /F C:\WINDEL\Dados\SISTEMA.FDB
%fb_instalado%unins000.exe"
rd /s/q %clear_fb%
call %instala_firebird%
echo.
echo.      * LEIA COM ATENCAO! *
echo.
echo.
echo.     AGUARDANDO INSTRUCAO NO SCRIPT - 
echo.
echo.     AO CLICAR EM CONTINUAR SISTEMA IRA FAZER RESTORE
echo. 
echo.     PARA VERSAO WINDEL 4 - FIREBIRD 3
echo.
echo.
pause
%fb3%gbak" -C -O -P 8192 -R -V -fix_fss_m iso8859_1 -fix_fss_d iso8859_1 C:\WINDEL\Dados\SISTEMA.GBK  C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
%fb_instalado%bin\gfix" -mend -full -ignore -online %windel%Dados\SISTEMA.FDB -user sysdba -pas masterkey"
%winrar% a -agDDMMYYYY  C:\WINDEL\Dados\SISTEMA_CORRIGIDO_  C:\WINDEL\Dados\SISTEMA.FDB
del /F C:\WINDEL\Dados\SISTEMA.GBK
ren C:\WINDEL\WLU.exe WLU_old.exe
copy C:\projeto_4.0_Pablo\WLU.exe C:\WINDEL\
call "C:\WINDEL\WLU.exe"

echo ==================================
echo *          Gfix e Gback  / FIM   *
echo ==================================
pause
goto menu

:opcao2
cls
echo. ==================================
echo. *         VERIFICA BANCO / INICIO*
echo. ==================================
cd..
cd..
%fb_instalado%\bin\gfix" -mend -full -ignore -online C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo.
echo.    ***********************************************
echo.    ***                                         ***
echo.    ***  LEITURA DE ERROS NO BANCO!             ***
echo.    ***                                         ***
echo.    ***********************************************
echo.
pause
%fb_instalado%bin\gbak" -B -G -IG -L -V %windel%Dados\SISTEMA.FDB C:\WINDEL\Dados\SISTEMA.GBK  -user sysdba -pas masterkey"
     copy "C:\WINDEL\Dados\SISTEMA.FDB" "C:\WINDEL\Dados\SISTEMA_BACKUP.FDB"
     del /F C:\WINDEL\Dados\SISTEMA.FDB
     %fb_instalado%bin\gbak" -C -O -P 8192 -R -V -fix_fss_m iso8859_1 -fix_fss_d iso8859_1 C:\WINDEL\Dados\SISTEMA.GBK  C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
     %fb_instalado%bin\gfix" -mend -full -ignore -online %windel%Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo. ==================================
echo. *          VERIFICA BANCO / FIM  *
echo. ==================================
pause
goto menu

:opcao3
cls
echo. ==================================
echo. *  VERIFICA BANCO E CORRIGE 2.0  *
echo. ==================================
cd..
cd..
REM "c:\Program Files (x86)\firebird\firebird_2_0\bin\gfix" -mend -full -ignore -online C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo.
echo.    ***********************************************
echo.    ***                                         ***
echo.    ***  LEITURA DE ERROS NO BANCO!             ***
echo.    ***                                         ***
echo.    ***********************************************
echo.
pause
REM "c:\Program Files (x86)\firebird\firebird_2_0\bin\gbak" -B -G -IG -L -V C:\WINDEL\Dados\SISTEMA.FDB C:\WINDEL\Dados\SISTEMA.GBK  -user sysdba -pas masterkey"
REM "c:\Program Files (x86)\firebird\firebird_2_0\bin\gbak" -C -O -P 8192 -R -V -fix_fss_m iso8859_1 -fix_fss_d iso8859_1 C:\WINDEL\Dados\SISTEMA.GBK C:\WINDEL\Dados\SISTEMA_CORRIGIDO.FDB -user sysdba -pas masterkey"
echo. ==================================
echo. *  VERIFICA BANCO E CORRIGE 2.0  *
echo. ==================================
pause
goto menu

:opcao4
cls
echo.
echo. ==================================
echo. *  VERIFICA BANCO E CORRIGE 2.5  *
echo. ==================================
cd..
cd..
REM "c:\Program Files\firebird\firebird_2_5\bin\gfix" -mend -full -ignore -online C:\WINDEL\Dados\SISTEMA.FDB -user sysdba -pas masterkey"
echo.
echo.    ***********************************************
echo.    ***                                         ***
echo.    ***  LEITURA DE ERROS NO BANCO!             ***
echo.    ***                                         ***
echo.    ***********************************************
echo.
pause
REM "c:\Program Files\firebird\firebird_2_5\bin\gbak" -B -G -IG -L -V C:\WINDEL\Dados\SISTEMA.FDB C:\WINDEL\Dados\SISTEMA.GBK  -user sysdba -pas masterkey"
REM "c:\Program Files\firebird\firebird_2_5\bin\gbak" -C -O -P 8192 -R -V -fix_fss_m iso8859_1 -fix_fss_d iso8859_1 C:\WINDEL\Dados\SISTEMA.gbk C:\WINDEL\Dados\SISTEMA_CORRIGIDO.FDB -user sysdba -pas masterkey"
echo. ==================================
echo. *  VERIFICA BANCO E CORRIGE 2.5  *
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