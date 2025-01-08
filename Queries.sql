-- Query 1
With Funding_Amount as ( Select PID,
Sum(Amount) as Amount From Fund
Group by PID Having Amount >= 5000)
Select
p.PID,
p.Age,
Sum(vs.Hours) as Volunteer_Hours, Count(ep.Event_ID) as EduTour_Participated, Count(wa.Event_ID) as Workshop_Participated,
(Case when p.PID in (Select PID from Funding_Amount) then 1 else 0 end) as Donation_Made From Person p
Left Join Volunteer_support_Volunteer_Day vs
Using(PID)
Left Join Visitor_participate_Educational_Tour ep Using(PID)
Left Join Member_attend_Workshop wa Using(PID)
Group by PID;

-- Query 2
SELECT s.Product_ID, s.cost_per_plant, s.yield_per_plant, s.area_per_plant, s.Quantity FROM seed s, plot p
WHERE p.Plot_ID = 1
AND p.Soil_type = s.required_soil_type
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/seed_info.csv' FIELDS ENCLOSED BY '"'
TERMINATED BY ','
ESCAPED BY '"'
LINES TERMINATED BY '\r\n';
SELECT p.Size, sum(f.Amount) as available_fund FROM Plot p, Fund_invest_Planting_schedule i, Fund f
WHERE i.Plot_ID = 1
AND i.Schedule_ID = 1
AND p.Plot_ID = i.Plot_ID
AND f.Fund_ID = i.Fund_ID
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/plot_info.csv' FIELDS ENCLOSED BY '"'
TERMINATED BY ','
ESCAPED BY '"'
LINES TERMINATED BY '\r\n';

-- Query 3
WITH attendmember AS ( SELECT
PID, SUM(activity) AS attendactivity FROM (
WITH MonthlyEvent AS (
SELECT Event.Event_ID, Event.Event_Date
FROM Event
WHERE DATE_FORMAT(Event.event_date, '%Y-%m') = '2023-12'
)
SELECT PID, COUNT(PID) AS activity
FROM member_attend_workshop
JOIN MonthlyEvent
ON member_attend_workshop.Event_ID = MonthlyEvent.Event_ID GROUP BY PID
UNION ALL
SELECT visitor_participate_educational_tour.PID,
COUNT(visitor_participate_educational_tour.PID) AS activity
FROM visitor_participate_educational_tour, member, MonthlyEvent
where visitor_participate_educational_tour.PID = member.PID
and visitor_participate_educational_tour.Event_ID = MonthlyEvent.Event_ID
GROUP BY PID
UNION ALL
SELECT volunteer_support_volunteer_day.PID, COUNT(volunteer_support_volunteer_day.PID)
AS activity
FROM volunteer_support_volunteer_day, member, MonthlyEvent
Where volunteer_support_volunteer_day.PID = member.PID
and volunteer_support_volunteer_day.Event_ID = MonthlyEvent.Event_ID GROUP BY PID
) AS activities GROUP BY PID ORDER BY PID
)
SELECT
MAX(Person.name) AS Name,
Member.PID,
attendmember.attendactivity AS Month_attend_activity, COUNT(month_event.Event_ID) AS member_month_total_activity, (attendmember.attendactivity / COUNT(month_event.Event_ID)) AS
Member_Monthly_Engagement_Percentage, MAX(Person.Gender) AS Gender,
MAX(Person.Age) AS Age,
MAX(Person.City) AS City,
MAX(Person.State) AS State, MAX(Member.Membership_Status) AS Membership_Status, Max(Member.Join_Date) as Join_Date, Max(Member.Renewal_Date) as Renewal_Date
FROM Member
JOIN attendmember ON Member.PID = attendmember.PID JOIN (
SELECT Event.Event_ID, Event.Event_Date
FROM Event
WHERE DATE_FORMAT(Event.event_date, '%Y-%m') = '2023-12'
) AS month_event ON Member.Join_Date <= month_event.Event_Date JOIN Person ON Member.PID = Person.PID
GROUP BY Member.PID
ORDER BY Member_Monthly_Engagement_Percentage DESC
