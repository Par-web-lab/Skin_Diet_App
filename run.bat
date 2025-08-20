@echo off
REM Change to the source folder
cd src

REM Compile the Java file with the MySQL connector in classpath
javac -cp ".;..\lib\mysql-connector-j-9.4.0.jar" SkinDietPlannerGUI.java
if errorlevel 1 (
    echo Compilation failed!
    pause
    exit /b
)

REM Run the Java program with the MySQL connector in classpath
java -cp ".;..\lib\mysql-connector-j-9.4.0.jar" SkinDietPlannerGUI
pause
