#define MyAppName "Alchemical Tarot of the Human Condition"
#define MyAppExeName "a-tarot-for-the-modern-age.exe"
#define MyAppPublisher "whisprer"
#define MyAppURL "https://github.com/whisprer/tarot"
#define MyAppVersion GetEnv("APP_VERSION")

[Setup]
AppId={{E9A6B2D9-3E18-4D6D-8C7B-8F3D1E8B7A11}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=out
OutputBaseFilename=Alchemical-Tarot-Setup-{#MyAppVersion}
Compression=lzma
SolidCompression=yes

; ---- Icons / branding ----
SetupIconFile=payload\icon.ico
UninstallDisplayIcon={app}\{#MyAppExeName}

; ---- EULA / README shown in wizard ----
LicenseFile=payload\EULA.txt
InfoBeforeFile=payload\README_DIST.txt

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "payload\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\deck_data.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\README_DIST.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\EULA.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "payload\icon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Run {#MyAppName}"; Flags: nowait postinstall skipifsilent
