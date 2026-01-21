#define MyAppName "A Tarot For The Modern Age"
#define MyAppExeName "a-tarot-for-the-modern-age.exe"
#define MyAppPublisher "RYOModular"
#define MyAppURL "https://example.com"
#define MyAppVersion GetEnv("APP_VERSION")

[Setup]
AppId={{A0D7C3E4-7C1A-4B4A-BD9C-5F1A2D0F9A11}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputDir=out
OutputBaseFilename=TarotSetup-Windows-{#MyAppVersion}
Compression=lzma2
SolidCompression=yes

; These show during install:
LicenseFile=LICENSE.txt
InfoBeforeFile=README_DIST.txt

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "deck_data.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "EULA.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "README_DIST.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
