#define Here ExtractFileDir(__FILE__)
#define MyAppName "Alchemical Tarot of the Human Condition"
#define MyAppExeName "installers/windows/payload/a-tarot-for-the-modern-age.exe"
#define MyAppPublisher "whisprer"
#define MyAppVersion GetEnv("APP_VERSION")

[Setup]
AppId={{A0D7C3E4-7C1A-4B4A-BD9C-5F1A2D0F9A11}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes

; Output is relative to THIS .iss folder => installers/windows/out/
OutputDir=out
OutputBaseFilename=Alchemical-Tarot-Setup-{#MyAppVersion}
Compression=lzma2
SolidCompression=yes

; Installer UI text screens
LicenseFile=payload\EULA.txt
InfoBeforeFile=payload\README_DIST.txt

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "payload\a-tarot-for-the-modern-age.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\deck_data.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\README_DIST.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\EULA.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
