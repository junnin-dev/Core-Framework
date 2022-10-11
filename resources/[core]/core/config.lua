JNConfig = {}

JNConfig.MaxPlayers = GetConvarInt('sv_maxclients', 48)
JNConfig.DefaultSpawn = vector4(-1035.71, -2731.87, 12.86, 0.0)
JNConfig.UpdateInterval = 5
JNConfig.StatusInterval = 5000

JNConfig.Money = {}
JNConfig.Money.MoneyTypes = {cash = 500, bank = 5000, crypto = 0}
JNConfig.Money.DontAllowMinus = {'cash', 'crypto'}
JNConfig.Money.PayCheckTimeOut = 10
JNConfig.Money.PayCheckSociety = false

JNConfig.Player = {}
JNConfig.Player.HungerRate = 4.2
JNConfig.Player.ThirstRate = 3.8
JNConfig.Player.Bloodtypes = {"A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"}

JNConfig.Server = {}
JNConfig.Server.Closed = false
JNConfig.Server.ClosedReason = "Server Closed"
JNConfig.Server.Uptime = 0
JNConfig.Server.Whitelist = false
JNConfig.Server.WhitelistPermission = 'admin'
JNConfig.Server.PVP = true
JNConfig.Server.Discord = ""
JNConfig.Server.CheckDuplicateLicense = true
JNConfig.Server.Permissions = {'god', 'admin', 'mod'}

JNConfig.Notify = {}

JNConfig.Notify.NotificationStyling = {
    group = false,
    position = "right",
    progress = true
}

JNConfig.Notify.VariantDefinitions = {
    success = {classes = 'success', icon = 'done'},
    primary = {classes = 'primary', icon = 'info'},
    error = {classes = 'error', icon = 'dangerous'},
    police = {classes = 'police', icon = 'local_police'},
    ambulance = {classes = 'ambulance', icon = 'fas fa-ambulance'}
}
