return {
        settings = {
            basedpyright = {
                analysis = {
                    diagnosticSeverityOverrides = {
                        reportMissingTypeStubs = false,
                        reportMissingParameterType = "warning",
                        reportAny = "information",
                        reportUnknownVariableType = "warning",
                        reportUnknownArgumentType = "warning",
                        reportUnknownParameterType = "warning",
                        reportUnknownMemberType = "warning",
                        reportUnusedCallResult = false,
                        strictDictionaryInference = false,
                        reportExplicitAny = false,
                    }
                }
            }
        }
    }
