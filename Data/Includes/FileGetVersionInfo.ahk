; f :=	FileGetVersionInfo_AW(A_AhkPath).ProductName
	; MsgBox %	f

FileGetVersionInfo_AW( peFile="" ) {	; Written by SKAN
	; www.autohotkey.com/forum/viewtopic.php?p=233188#233188  CD:24-Nov-2008 / LM:27-Oct-2010
	Static	CS, HexVal, Sps="                        ", DLL="Version\", StrGet="StrGet"
	Static	fInfo :=	["FileDescription","FileVersion","InternalName","LegalCopyright","OriginalFilename","ProductName","ProductVersion"
		 ,"CompanyName","PrivateBuild","SpecialBuild","LegalTrademarks"]
	If	!CS
		CS :=	A_IsUnicode ? "W" : "A", HexVal :=	"msvcrt\s" (A_IsUnicode ? "w": "" ) "printf"

	If	!FSz :=	DllCall( DLL "GetFileVersionInfoSize" CS , Str,peFile, UInt,0 )
		Return	"", DllCall( "SetLastError", UInt,1 )

	VarSetCapacity( FVI, FSz, 0 ), VarSetCapacity( Trans,8 * ( A_IsUnicode ? 2 : 1 ) )
	DllCall( DLL "GetFileVersionInfo" CS, Str,peFile, Int,0, UInt,FSz, UInt,&FVI )
	If	!DllCall( DLL "VerQueryValue" CS, UInt,&FVI, Str,"\VarFileInfo\Translation", UIntP,Translation, UInt,0 )
		Return	"", DllCall( "SetLastError", UInt,2 )

	If	!DllCall( HexVal, Str,Trans, Str,"%08X", UInt,NumGet(Translation+0) )
		Return	"", DllCall( "SetLastError", UInt,3 )
	res :=	{}
	For each, attr in fInfo
	{
		subBlock :=	"\StringFileInfo\" SubStr(Trans,-3) SubStr(Trans,1,4) "\" attr
		If	!DllCall( DLL "VerQueryValue" CS, UInt,&FVI, Str,SubBlock, UIntP,InfoPtr, UInt,0 )
			Continue

		if	Value :=	( A_IsUnicode ? %StrGet%( InfoPtr, DllCall( "lstrlen" CS, UInt,InfoPtr ) )
		 :  DllCall( "MulDiv", UInt,InfoPtr, Int,1, Int,1, "Str"  ) )
			res.Insert(attr,Value)
	}
	Return	res
}
