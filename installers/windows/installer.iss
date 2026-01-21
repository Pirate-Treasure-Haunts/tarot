#define MyAppName "Alchemical Tarot of the Human Condition"
#define MyAppExeName "Alchemical-Tarot-of-the-Human-Condition-win71011.exe"
#define MyAppPublisher "whispr.dev"
#define MyAppURL "https://whispr.dev/tarot/"
#define MyAppVersion GetEnv("APP_VERSION")

; Inno resolves relative paths from the .iss file's folder.
; This points back to repo root.
#define RepoRoot "..\.."

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

; Show these during install:
LicenseFile={#RepoRoot}\EULA.txt
InfoBeforeFile={#RepoRoot}\README_DIST.txt

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{#RepoRoot}\dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RepoRoot}\deck_data.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RepoRoot}\LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RepoRoot}\EULA.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#RepoRoot}\README_DIST.txt"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent
