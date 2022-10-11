RegisterCommand("record", function()
    StartRecording(1)
    TriggerEvent('Core:Notify', "Comecei a gravar!", "success")
end, false)

RegisterCommand("clip", function()
    StartRecording(0)
end, false)

RegisterCommand("saveclip", function()
    StopRecordingAndSaveClip()
    TriggerEvent('Core:Notify', "Gravação salva!", "success")
end, false)

RegisterCommand("delclip", function()
    StopRecordingAndDiscardClip()
    TriggerEvent('Core:Notify', "Gravação excluída!", "error")
end, false)

RegisterCommand("editor", function()
    NetworkSessionLeaveSinglePlayer()
    ActivateRockstarEditor()
    TriggerEvent('Core:Notify', "Mais tarde Alligator!", "error")
end, false)
