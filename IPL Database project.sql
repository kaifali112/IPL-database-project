## Most succcessful team in terms of most no of matches won

select  winner as teams, count(winner) as team_max_won
from ipl_matches 
group by winner 
order by team_max_won desc ;

## Most player of the match by each player

select player_of_match, count(player_of_match) as num_
from ipl_matches 
group by player_of_match
order by num_ desc;

## No of matches in each venue

select  venue, count(venue) as max_no_of_matches
from ipl_matches
group by venue
order by max_no_of_matches desc;

## No of tosses won by each team

select toss_winner as teams, count(toss_winner) as max_toss_won
from ipl_matches 
group by teams
order by max_toss_won desc;


## No of matches each year

select year(date) as year_ , count(venue) as no_of_matches
from ipl_matches 
group by year_
order by year_;

## Matches won in terms of runs/wickets margin

select winner, result_margin, result, year(date) as year_
from ipl_matches 
order by year_ ;

## Sum of runs in first innings by each team

select sum(total_runs) as total_run, inning, batting_team
from ipl_detailed 
where inning = 1
group by batting_team;

## Sum of runs in second innings by each team

select sum(total_runs) as total_run, inning, batting_team
from ipl_detailed 
where inning = 2
group by batting_team;

## Total runs by each player who got player of the match 

select m.player_of_match as player_name, d.batting_team as team, sum(d.total_runs) as runs 
from ipl_detailed d
join ipl_matches m on d.id = m.id
where batsman = player_of_match
group by player_name ;

## Total no of wickets by each team in particular year

select d.bowling_team as team, count(d.is_wicket) as wickets, year(m.date) as date_
from ipl_detailed d
join ipl_matches m on d.id = m.id
where is_wicket = 1
group by team, date_ 
order by date_  ;

## No of boundaries by each team in given years

select d.batting_team as team, count(d.total_runs) as boundary_no, year(m.date) as date_
from ipl_detailed d
join ipl_matches m on d.id = m.id
where total_runs in ( 4, 5, 6, 7 )
group by date_ , team 
order by date_ ;

## Total runs on each ground

select m.venue as venue, sum(d.total_runs) as total_runs, year(m.date) as date_
from ipl_detailed d 
join ipl_matches m on d.id = m.id
group by venue, date_
order by date_ ;











