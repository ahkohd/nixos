{ ... }: {
  home.file.".config/karabiner/_karabiner.json".text = ''
    {
        "profiles": [
            {
                "complex_modifications": {
                    "rules": [
                        {
                            "description": "Map PC Paste Key To Cmd + V",
                            "manipulators": [
                                {
                                    "from": { "key_code": "paste" },
                                    "to": [
                                        {
                                            "key_code": "v",
                                            "modifiers": ["command"]
                                        }
                                    ],
                                    "type": "basic"
                                }
                            ]
                        },
                        {
                            "description": "Map PC Copy Key To Cmd + C",
                            "manipulators": [
                                {
                                    "from": { "key_code": "copy" },
                                    "to": [
                                        {
                                            "key_code": "c",
                                            "modifiers": ["command"]
                                        }
                                    ],
                                    "type": "basic"
                                }
                            ]
                        }
                    ]
                },
                "devices": [
                    {
                        "disable_built_in_keyboard_if_exists": true,
                        "identifiers": {
                            "is_keyboard": true,
                            "is_pointing_device": true,
                            "product_id": 24926,
                            "vendor_id": 7504
                        }
                    },
                    {
                        "disable_built_in_keyboard_if_exists": true,
                        "identifiers": {
                            "is_keyboard": true,
                            "is_pointing_device": true,
                            "product_id": 142,
                            "vendor_id": 5426
                        }
                    }
                ],
                "name": "Default profile",
                "selected": true,
                "virtual_hid_keyboard": { "keyboard_type_v2": "ansi" }
            }
        ]
    }
  '';
}
