;--------------------------------
;Custom Variables

;Define name of the product
!define PRODUCT "ExampleInstaller"


;--------------------------------
;General information

;The name of the installer
Name "${PRODUCT}"

;The license that the user needs to accept to run the installer
LicenseData "..\LICENSE"

;The output file path of the installer to be created
OutFile "installer.exe"

;The default installation directory
InstallDir "$PROGRAMFILES64\${PRODUCT}"

;Registry key to check for a install directory from a previous installation
InstallDirRegKey HKLM "Software\${PRODUCT}" "Install_Dir"

;Request application privileges for admin level privileges
RequestExecutionLevel admin


;--------------------------------
;Installer pages

;Show a page where the user needs to accept a license
Page license
;Show a page where the user can customize the components to be installed
Page components
;Show a page where the user can customize the install directory
Page directory
;Show a page where the progress of the install is listed
Page instfiles


;--------------------------------
;Uninstaller pages

;Show a page where the user needs to confirm the uninstall
UninstPage uninstConfirm
;Show a page where the progress of the uninstall is listed
UninstPage instfiles


;--------------------------------
;Installer Components

;Main component
Section "Main Component Name (mandatory)"

  ;Make this component mandatory so the user is not able to disable it
  SectionIn RO


  ;Write the selected (either default or customized) installation path into the
  ;registry
  WriteRegStr HKLM "Software\${PRODUCT}" "Install_Dir" "$INSTDIR"


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


  ;Now you can create an uninstaller that will also be recognized by Windows:
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "DisplayName"          "${PRODUCT}"
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "UninstallString"      "$\"$INSTDIR\uninstall.exe$\""
  WriteRegStr   HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "NoModify"        1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}" "NoRepair"        1
  WriteUninstaller "uninstall.exe"

SectionEnd


;Optional component (can be disabled by the user)
Section "Optional Component Name: Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\${PRODUCT}"
  CreateShortcut "$SMPROGRAMS\${PRODUCT}\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortcut "$SMPROGRAMS\${PRODUCT}\Example Text File Link.lnk" "$INSTDIR\example.txt" "" "$INSTDIR\example.txt" 0
  CreateShortcut "$SMPROGRAMS\${PRODUCT}\Example Directory Link.lnk" "$INSTDIR\ExampleDirectory" "" "$INSTDIR\ExampleDirectory" 0

SectionEnd


;Uninstall component
Section "Uninstall"

  ;Remove registry keys that were set by the installer
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT}"
  DeleteRegKey HKLM "Software\${PRODUCT}"

  ;Remove files that were installed by the installer and the created uninstaller
  Delete "$INSTDIR\example.txt"
  Delete "$INSTDIR\custom_name.txt"
  Delete "$INSTDIR\ExampleDirectory\custom_name_in_directory.txt"
  Delete "$INSTDIR\uninstall.exe"

  ;Remove shortcuts if existing
  Delete "$SMPROGRAMS\${PRODUCT}\*.*"

  ;Remove directories that were created by the installer
  RMDir "$SMPROGRAMS\${PRODUCT}"
  RMDir "$INSTDIR\ExampleDirectory"
  RMDir "$INSTDIR"

SectionEnd
