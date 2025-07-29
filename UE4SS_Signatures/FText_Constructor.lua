-- port to (LOCKDOWN Protocol)UE5.5.4 by Kl1nge5(Steam name:interrupt 3)
function Register()
    return "40 53 57 48 83 EC 38 48 89 6C 24 58 48 8B FA 48 89 74 24 60 48 8B D9 33 F6 4C 89 74 24 30 83 7A ?? 01 89 74 24 50"
end

function OnMatchFound(MatchAddress)
    return MatchAddress
end