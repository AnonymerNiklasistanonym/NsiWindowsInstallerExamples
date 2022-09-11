;--------------------------------
;General information

;The name of the installer
Name "Example Installer Name"

;The output file path of the installer to be created
OutFile "installer.exe"

;The default installation directory
InstallDir "$DESKTOP\ExampleInstallerDirectory"

;Request application privileges for user level privileges
RequestExecutionLevel user


;--------------------------------
;Installer pages

;Show a page where the user can customize the install directory
Page directory
;Show a page where the progress of the install is listed
Page instfiles


;--------------------------------
;Installer Components

;A section for each component that should be installed
Section "Component Name"

  ;Set output path to the installation directory
  SetOutPath $INSTDIR

  ;Now you can list files that should be extracted to this output path or create
  ;directories:

  ;Copy a file to the current SetOutPath directory
  File "..\example_files\example.txt"

  ;Copy a file to the current SetOutPath directory with a custom name
  File "/oname=custom_name.txt" "..\example_files\example.txt"

  ;Create a directory
  CreateDirectory "$INSTDIR\ExampleDirectory"

  ;Change the output path to the created directory
  SetOutPath "$INSTDIR\ExampleDirectory"

  ;Copy a file to the current SetOutPath directory with a custom name
  File "/oname=custom_name_in_directory.txt" "..\example_files\example.txt"

SectionEnd
