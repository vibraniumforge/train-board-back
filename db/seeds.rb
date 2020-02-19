Train.destroy_all

trains = Train.create([
    {destination: "Paris - Gare du Nord", newtime:"0115", newtime24:"1315", origin: "London - St. Pancras", remarks_boarding: "L 15M", scheduled: "0100", scheduled24: "1300", service: "Eurostar", trainno: "1"},
    {destination: "Brussels - Gare du Midi", newtime:"", newtime24:"", origin: "Paris - Gare du Nord", remarks_boarding: "Boarding", scheduled: "0200", scheduled24: "1400", service: "Thalys", trainno: "3"},
    {destination: "Marseilles - St. Charles", newtime:"", newtime24:"", origin: "Paris - Gare de Lyon", remarks_boarding: "On Time", scheduled: "0300", scheduled24: "1500", service: "TGV", trainno: "5"},
    {destination: "Chicago Union Station", newtime:"", newtime24:"", origin: "Emeryville", remarks_boarding: "On Time", scheduled: "0330", scheduled24: "1530", service: "California Zephyr", trainno: "6"},
    {destination: "Istanbul - Sirkeci", newtime:"", newtime24:"", origin: "Paris - Gare de l' Est", remarks_boarding: "On Time", scheduled: "0400", scheduled24: "1600", service: "Orient Express", trainno: "7"},
    {destination: "Beijing", newtime:"", newtime24:"", origin: "Moscow", remarks_boarding: "On Time", scheduled: "0500", scheduled24: "1700", service: "Trans-Siberian Railway", trainno: "9"},
    {destination: "Perth Terminal", newtime:"", newtime24:"", origin: "Sydney Central", remarks_boarding: "On Time", scheduled: "0600", scheduled24: "1800", service: "Indian Pacific", trainno: "11"},
    {destination: "Melbourne - Southern Cross", newtime:"", newtime24:"", origin: "Adelaide - Parklands Terminal", remarks_boarding: "On Time", scheduled: "0700", scheduled24: "1900", service: "The Overland", trainno: "13"},
    {destination: "Los Angeles Union Station", newtime:"", newtime24:"", origin: "Seattle King Street", remarks_boarding: "On Time", scheduled: "0945", scheduled24: "0945", service: "Coast Starlight", trainno: "14"},
    {destination: "Darwin", newtime:"", newtime24:"", origin: "Adelaide - Parklands Terminal", remarks_boarding: "On Time", scheduled: "0700", scheduled24: "1900", service: "The Ghan", trainno: "15"},
    {destination: "Munich Hauptbahnhof", newtime:"", newtime24:"", origin: "Vienna Hauptbahnhof", remarks_boarding: "On Time", scheduled: "0730", scheduled24: "1930", service: "Railjet", trainno: "17"},
    {destination: "Hogwart's Caslte", newtime:"", newtime24:"", origin: "London - King's Cross", remarks_boarding: "On Time", scheduled: "0800", scheduled24: "2000", service: "Hogwart's Express", trainno: "19"},
])

puts "Seeds done."