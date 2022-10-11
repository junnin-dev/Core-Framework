Core = {}
Core.Config = JNConfig
Core.Shared = JNShared
Core.ClientCallbacks = {}
Core.ServerCallbacks = {}

exports('GetCoreObject', function()
    return Core
end)