local load_lang_plugins  = function(languages)
    local prefix = "language-plugins.language."
    local merged = {}
    for _, lang in ipairs(languages) do 
        local plugin_name = prefix..lang
        local status, specs = pcall(require, plugin_name)
        if not status then 
            print("Invalid language: " .. plugin_name)
        else
            for _, spec in ipairs(specs) do 
                merged[#merged+1] = spec
            end
        end
    end
    return merged
end 

return load_lang_plugins
