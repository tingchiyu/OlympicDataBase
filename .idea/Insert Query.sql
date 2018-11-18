insert into Country
values(name/*String*/, gold/*int*/, silver/*int*/, bronze/*int*/, isHost_flag/*bit*/);

insert into Venue
values(vname/*String*/, location/*String*/, capacity/*int*/, size/*String*/);

insert into Medal
values(type/*char*/, stname/*String*/, athleteid/*int*/, groupid/*int*/);

insert into Athlete
values(athelteid/*int*/, countryname/*String*/, sport_category/*String*/, name/*String*/, sex/*String*/, height/*int*/);

insert into Group
values(groupid/*int*/, countryname/*String*/, sport_category/*String*/, sex/*String*/);

insert into In_Group
values(groupid/*int*/, athleteid/*int*/);

insert into Ind_Participate
values(eventname/*String*/, athelteid/*int*/, performance/*int*/);

insert into Group_Participate
values(eventname/*String*/, groupid/*int*/, performance/*int*/);

insert into Event
values(eventname/*String*/, stname/*String*/, date/*Date*/, isfinal_flag/*bit*/);

insert into Sport_Type
values(stname/*String*/, sport_category/*String*/, vname/*String*/);

insert into Highlight
values(hlid/*int*/, eventname/*String*/, description/*String*/);