Config = {}

Config.marker = {
    type = 21,
    scale = 0.7,
    colorR = 105,
    colorG = 105,
    colorB = 105,
}

Config.marker2 = {
    type = 1,
    scale = 0.9,
    colorR = 105,
    colorG = 105,
    colorB = 105,
}

Config.acceuil = {
    pos = {
        {
            coords = vector3(441.12, -981.12, 30.67)
        }
    },
    ped = {
        {
            coords = vector4(441.07, -978.85, 30.67, 178.58),
            animationDict = "aaa",
            animationName = "aaa"
        },
        {
            coords = vector4(449.43, -981.78, 30.67, 119.05),
            animationDict = "bbb",
            animationName = "bbb"
        }
    }
}

Config.office = {
    pos = vector3(448.44, -973.04, 30.67)
}

Config.vestiaire = {
    pos = {
        {
            coords = vector3(452.60, -992.80, 30.68)
        },
    },
}

Config.garage = {
    pos = {
        out = vector4(436.49, -997.08, 25.75, 175.74),
        inPed = vector3(451.96, -988.16, 26.66),
        inCar = vector3(452.63, -996.89, 25.75),
        heliPed = vector4(463.66, -982.21, 43.68, 87.87),
        heliSpawn = vector4(449.18, -981.29, 43.68, 269.29),
        heliDelete = vector3(449.26, -981.16, 43.68),
    },
    car = {
        {
            model = "police",
            label = "Cruiser"
        },
        {
            model = "police2",
            label = "Patrol"
        },
        {
            model = "police4",
            label = "Undercover"
        }
    }
}

Config.armory = {
    pos = {
        {
            coords = vector3(452.32, -980.20, 30.67),
        }
    },
    ped = {
        coords = vector4(454.08, -980.09, 30.67, 82.20)
    },
    weapon = {
        grade = {
            recruit = {
                {
                    name = "Patrouille",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        }
                    }
                }
            },

            officier = {
                {
                    name = "Patrouille",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        }
                    }
                },
                {
                    name = "Patrouille +",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_PUMPSHOTGUN",
                            label = "Fusil à pompe",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_SPECIALCARBINE",
                            label = "Fusil d\'assault",
                            ammo = 250
                        }
                    }
                }
            },
            sergeant = {
                {
                    name = "Patrouille",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        }
                    }
                },
                {
                    name = "Patrouille +",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_PUMPSHOTGUN",
                            label = "Fusil à pompe",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_SPECIALCARBINE",
                            label = "Fusil d\'assault",
                            ammo = 250
                        }
                    }
                },
                {
                    name = "Groupe d'intervention",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_PUMPSHOTGUN_MK2",
                            label = "Fusil à pompe",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_SPECIALCARBINE_MK2",
                            label = "Fusil d'assault",
                            ammo = 250
                        }
                    }
                }
            },
            lieutenant = {
                {
                    name = "Patrouille",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        }
                    }
                },
                {
                    name = "Patrouille +",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_PUMPSHOTGUN",
                            label = "Fusil à pompe",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_SPECIALCARBINE",
                            label = "Fusil d\'assault",
                            ammo = 250
                        }
                    }
                },
                {
                    name = "Groupe d'intervention",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_STUNGUN_MP",
                            label = "Tazer",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_PUMPSHOTGUN_MK2",
                            label = "Fusil à pompe",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_SPECIALCARBINE_MK2",
                            label = "Fusil d'assault",
                            ammo = 250
                        }
                    }
                },
                {
                    name = "Sniper",
                    list = {
                        {
                            model = "WEAPON_NIGHTSTICK",
                            label = "Matraque",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_FLASHLIGHT",
                            label = "Flashlight",
                            ammo = nil
                        },
                        {
                            model = "WEAPON_PISTOL",
                            label = "Pistolet",
                            ammo = 250
                        },
                        {
                            model = "WEAPON_HEAVYSNIPER",
                            label = "Fusil de sniper",
                            ammo = 30
                        }
                    }
                }
            }
        }
    }
}