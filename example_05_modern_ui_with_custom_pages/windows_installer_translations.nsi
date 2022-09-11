;At start will be searched if the current system language is in this list,
;if not the first language in this list will be chosen as language
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "German"

;Language strings

LangString LangStringSecMainComponentName ${LANG_ENGLISH} "Main Component Name (required)"
LangString LangStringSecMainComponentName ${LANG_GERMAN}  "Hauptkomponentenname (benötigt)"

LangString LangStringSecMainComponentDescription ${LANG_ENGLISH} "Description Main Component"
LangString LangStringSecMainComponentDescription ${LANG_GERMAN}  "Beschreibung der Hauptkomponente"

LangString LangStringSecOptionalComponentName ${LANG_ENGLISH} "Optional Component Name: Start Menu Shortcuts"
LangString LangStringSecOptionalComponentName ${LANG_GERMAN}  "Optionaler Komponentenname: Startmenü Verknüpfungen"

LangString LangStringSecOptionalComponentDescription ${LANG_ENGLISH} "Description Optional Component: Start Menu Shortcuts"
LangString LangStringSecOptionalComponentDescription ${LANG_GERMAN}  "Beschreibung der optionalen Komponente: Startmenü Verknüpfungen"

LangString LangStringUninstallLink ${LANG_ENGLISH} "Uninstall"
LangString LangStringUninstallLink ${LANG_GERMAN}  "Entfernen"

LangString LangStringExampleTextFileLink ${LANG_ENGLISH} "Example Text File Link"
LangString LangStringExampleTextFileLink ${LANG_GERMAN}  "Beispiel Textdatei-Link"

LangString LangStringExampleDirectoryLink ${LANG_ENGLISH} "Example Directory Link"
LangString LangStringExampleDirectoryLink ${LANG_GERMAN}  "Beispiel Ordner-Link"

LangString LangStringCustomPageOtherOptionsTitle ${LANG_ENGLISH} "Other Options"
LangString LangStringCustomPageOtherOptionsTitle ${LANG_GERMAN}  "Sonstige Optionen"

LangString LangStringCustomPageOtherOptionsSubTitle ${LANG_ENGLISH} "Select other options"
LangString LangStringCustomPageOtherOptionsSubTitle ${LANG_GERMAN}  "Wähle sonstige Optionen aus"

LangString LangStringCustomPageOtherOptionsCheckboxOpenInstallDir ${LANG_ENGLISH} "Open the install directory"
LangString LangStringCustomPageOtherOptionsCheckboxOpenInstallDir ${LANG_GERMAN}  "Öffne das Installationsverzeichnis"

LangString LangStringCustomPageOtherOptionsCheckboxOpenWebsite ${LANG_ENGLISH} "Open the website"
LangString LangStringCustomPageOtherOptionsCheckboxOpenWebsite ${LANG_GERMAN}  "Öffne die Website"
