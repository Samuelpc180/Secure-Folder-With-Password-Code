@ECHO OFF

::## Variables (set [Variable Name]="[Value]")
set FolderName="Name Here"
set Password="Password-Here"

::## Check if the Folder exists
if EXIST "Control Panel.{21EC2020-3A6C-1069-A3BM-08102B30309C}" goto CONFIRMUNLOCK
if NOT EXIST %FolderName% goto MDPrivate

::## WARNING: DON'T EDIT ANYTHING BELOW, PLEASE

::## Secure Folder Codes
:CONFIRM
	:: Asking to lock the Secure Folder
	echo Are you sure you want to lock your Secure Folder? (Y/N)
	echo -
	set/p "cho=Choise > "
	if %cho%==Y goto LOCK
	if %cho%==y goto LOCK
	if %cho%==n goto END
	if %cho%==N goto END
	cls
	echo Invalid choice.
	echo -
	pause
	cls
	goto CONFIRM
:LOCK
	:: Lock the Secure Folder
	cls
	echo Locking...
	ren %FolderName% "Control Panel.{21EC2020-3A6C-1069-A3BM-08102B30309C}"
	attrib +h +s "Control Panel.{21EC2020-3A6C-1069-A3BM-08102B30309C}"
	cls
	echo Your Secure Folder is successfully locked.
	echo -
	pause
	cls
	goto End
:CONFIRMUNLOCK
	:: Asking for the Password
	echo Enter the correct password to unlock your Secure Folder.
	echo -
	set/p "pass=Password > "
	if %pass%== %Password% goto UNLOCK
:UNLOCK
	:: Unlock the Secure Folder
	cls
	echo Unlocking...
	attrib -h -s "Control Panel.{21EC2020-3A6C-1069-A3BM-08102B30309C}"
	ren "Control Panel.{21EC2020-3A6C-1069-A3BM-08102B30309C}" %FolderName%
	cls
	echo Unlocked your Secure Folder successfully.
	echo -
	pause
	cls
	goto End
:FAIL
	:: When the Password is Incorrect
	cls
	echo Invalid password.
	echo -
	pause
	cls
	goto UNLOCK
:MDPrivate
	:: Create the Secure Folder
	md %FolderName%
	echo Secure Folder created successfully.
	echo -
	pause
	cls
	goto End
:End
	:: When it Ends
	cls