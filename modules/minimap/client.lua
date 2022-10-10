if cfg.circleMap then
    CreateThread(function()
        DisplayRadar(false)

        RequestStreamedTextureDict('circlemap', false)
        repeat Wait(100) until HasStreamedTextureDictLoaded('circlemap')
        AddReplaceTexture('platform:/textures/graphics', 'radarmasksm', 'circlemap', 'radarmasksm')

        SetMinimapClipType(1)
        SetMinimapComponentPosition('minimap', 'L', 'B', -0.017, 0.021, 0.207, 0.32)
        SetMinimapComponentPosition('minimap_mask', 'L', 'B', 0.06, 0.05, 0.132, 0.260)
        SetMinimapComponentPosition('minimap_blur', 'L', 'B', 0.005, -0.01, 0.166, 0.257)

        repeat Wait(100) until player

        Wait(500)
        SetRadarBigmapEnabled(true, false)
        Wait(500)
        SetRadarBigmapEnabled(false, false)

        local minimap = RequestScaleformMovie('minimap')
        repeat Wait(100) until HasScaleformMovieLoaded(minimap)

        DisplayRadar(cfg.persistentRadar)
        while true do
            BeginScaleformMovieMethod(minimap, 'SETUP_HEALTH_ARMOUR')
            ScaleformMovieMethodAddParamInt(3)
            EndScaleformMovieMethod()
            Wait(cfg.refreshRates.base)
        end
    end)
end