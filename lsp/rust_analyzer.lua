return {
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy
                checkOnSave = {
                    command = "clippy",
                }
            }
        }
    }
