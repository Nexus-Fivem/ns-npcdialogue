Config = {}

Config.npcs = {
    {
        name = "Manav Hilmiye",
        text = "Selam, Meyvem Var! Almak ister misin?",
        job = "Manav",
        ped = "a_f_m_beach_01",
        coords = vector4(-1379.14, 735.99, 181.97, 2.67),
        options = {
            {
                label = "Evet",
                event = "e clubdans7",
                type = "command",
                args = {'1'} -- Komut için argümanlar
            },
            {
                label = "Hayir!",
                event = "e clubdans7",
                type = "command",
                args = {'1'} -- Komut için argümanlar
            },
            {
                label = "Jim'i Ariyorum",
                event = "e clubdans7",
                type = "command",
                args = {'1'} -- Komut için argümanlar
            },
            {
                label = "Bana Bir Arac Lazim",
                event = "e clubdans7",
                type = "command",
                args = {'1'} -- Komut için argümanlar
            }
        }
    },
    {
        name = "Nexus Tester",
        text = "Merhaba, Taksi Nerden Bulabilirim ?",
        job = "Sporcu",
        ped = "a_f_m_bodybuild_01",
        coords = vector4(-1376.82, 735.64, 182.04, 354.47),
        options = {
            {
                label = "Defol Git Basimdan",
                event = "e clubdans7",
                type = "command", -- Komut veya Event
                args = {'1'} -- Komut için argümanlar
            },
            {
                label = "Bilmiyorum Malesef",
                event = "e clubdans7",
                type = "event",-- Komut veya Event
                args = {'2'} -- Komut için argümanlar
            }
        }
    },
    {
        name = "Gönül Alyaz",
        text = "Bu akşam Ne yapayım?",
        job = "Hayat Kadini",
        ped = "a_f_m_eastsa_01",
        coords = vector4(-1891.46, 2093.84, 140.99, 179.54),
        options = {
            {
                label = "Tavuk",
                event = "e clubdans7",
                type = "command",
                args = {'1'} -- Komut için argümanlar
            },
            {
                label = "Pilav",
                event = "e clubdans7",
                type = "command",
                args = {'2'} -- Komut için argümanlar
            },
            {
                label = "şalgam",
                event = "e clubdans7",
                type = "command",
                args = {'2'} -- Komut için argümanlar
            }
        }
    },
    {
        name = "Oyuncak Tüccarı",
        text = "Ne vereyim hayatım?",
        job = "Kaliteli Satici",
        ped = "a_f_y_bevhills_04",
        coords = vector4(-1888.5, 2088.87, 140.99, 349.48),
        options = {
            {
                label = "Doggy",
                event = "e clubdans7",
                type = "command",
                args = {'1'} -- Komut için argümanlar
            },
            {
                label = "69",
                event = "e clubdans2",
                type = "command",
                args = {'2'} -- Komut için argümanlar
            },
            {
                label = "Cow",
                event = "e clubdans3",
                type = "command",
                args = {'2'} -- Komut için argümanlar
            },
            {
                label = "yapmayak",
                event = "e clubdans4",
                type = "command",
                args = {'2'} -- Komut için argümanlar
            }
        }
    }
}