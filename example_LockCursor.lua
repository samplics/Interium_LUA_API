function LockCursor(bLock)
	ISurface.UnlockCursor()
	SetBool(bLock, true)
end
Hack.RegisterCallback("LockCursor", LockCursor)