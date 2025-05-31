# AWC Writing Conference

### Event summary 
Every spring and fall, the Atlanta Writer's Club holds a Writing Conference at the Westin hotel by the Atlanta airport. There are 16-18 agents and editors who offer query letter critiques, manuscript critiques, and hold pitch sessions, two or more speakers who offer workshops throughout the two days on various writing topics, author coaching opportunities, and then several other paid events, like the Friday night social, or the morning Q&A panels with editors and agents.

Approximately 300 writers partake in these conferences with the goal of becoming published authors and turning their manuscripts into books. Participants sign up to attend at https://atlantawritersconference.com. The conference is largely in person, though writers can sign up to attend virtually as well.


### Code summary
This code handles the scheduling and assignment of all participants to their registered activities. It ensures zero time conflicts and a minimum buffer time of 15 minutes between a participant's events to allow them to get to all their events on time. Additionally, it ensures that for any activities (such as the query letter critiques) where the participant did not select any particular agent/editor during registration, that they do not get assigned to any agents/editors they've already registered to meet with during any other activities (like the manuscript critiques or pitches).


### Code notebooks and overview

#### Agent-editor pairing
For the Friday query letter critiques, writers meet with an agent-editor pair to receive feedback on their query letters. This notebook is run as soon as the agents and editors attending the next conference are released (~5 months before the conference). The agent-editor pairing process consists of:
  1. Creating all pairwise combinations and getting their combined lists of the nonfiction and fiction genres the pairing represents
  2. Ranking these pairings via a couple different metrics, and then using these rankings to ensure that every agent is matched with the editor that would result in the greatest number of participants being able to meet with them for the Friday query letter critiques (participants can only meet with agents and editors they *aren't* meeting with for a pitch or manuscript critique, while also needing to meet with an agent-editor pair in which at least one or both of those in the pair represent the participants' fiction and/or nonfiction genres(s).)
  3. Assigning the final pairings to the meeting rooms they'll be in at the conference on Friday


#### Participant assignments
This notebook's code handles all the scheduling assignments. It pulls in the registration and waitlist information from CVent, cleans it some, and then does the following:
  1. Friday query letter critiques: The code assigns all participants registered for this event to a meeting time with an agent-editor pair that represents their genre(s) (but not any editors or agents they're meeting with for the manuscript critiques or pitches). The code also ensures that any participants who registered for the Friday workshop or Q&A panel do not have any time conflicts, and that any participants who signed up for multiple query letter critiques are assigned to different editor-agent pairs for each one without time conflicts. Participants could register for up to 3 QLCs.
  2. Friday author coaching: Participants who registered for this event are assigned meetings with the coach they requested, at a time that doesn't conflict with any of their other registered activities that Friday (e.g., the query letter critiques, Q&A panel, workshop). Participants could only register for one author coaching session.
  3. Saturday manuscript critiques: Participants are assigned meetings with the agent or editor who conducted their manuscript critique, while ensuring that nobody has back-to-back meetings (if they signed up for multiple). Participants could register for up to 2 MS critiques.
  4. Saturday pitches: Participants are assigned meetings with the agent or editor they requested a pitch with, while ensuring nobody has back-to-back meetings (if they signed up for multiple). Participants could register for up to 3 pitches.
  5. All other activities: All other paid or free activities occur at specific times in specific rooms; this code notebook keeps track of these other activities to ensure there aren't any scheduling conflicts.
  
Note: Once a participant is assigned to a timeslot, the code **keeps** that meeting time assignment for them moving forward, unless they cancel their registration.

#### Printouts
Now that all participants are scheduled for their different events, this notebook generates all the excel and word doc print-outs for the event, as well as the csv files needed for input into MailerLite (for automated emails) and TablesReady (for automated texts). This notebook outputs the following:
  - Conference Roster
  - List of all zoom meetings
  - Name tag information for printing
  - Individual room schedules for Friday and Saturday (to post on the room doors)
  - Individual participants schedules for Friday and Saturday (to print and provide to participants at check-in each day)
  - Printed schedules for the agents, editors and workshop and mini-seminar speakers
  - MailerLite custom fields information (csv file to upload to MailerLite)
  - TablesReady output (csv file to upload to TablesReady)
  - All datasets created in the notebook's mentioned above (output as excel files with date stamps). These are loaded in the participant assignment notebook, and ensure that participants don't get reassigned to new timeslots (or new agent-editor pairs on Friday). This is crucial; once we send out emails letting participants know their schedules for the conference, we don't want their schedules changing unless they cancel one or more activities or sign up for other ones.

### MailerLite
We use MailerLite to send out personalized, automated emails to different participant segments based on whether they're virtual or in-person. The same email template is used for all in-person attendees, or all virtual attendees, but only the portions relevant to each individual are displayed, which is managed via the custom fields. For instance, only participants who have registered for a manuscript critique will see that section of info in their conference emails.

### TablesReady
We use TablesReady to send automated texts 15 minutes prior to each participant's registered events (specifically, the Friday QLC and author coaching, and the Saturday manuscript critiques and pitches).


### Conclusion
The biannual Atlanta Writers Conference in a well-attended, well-known event in the Atlanta and US writing community. This repository's code streamlines and automates the process of scheduling participants for their different events and communicating with them via email and text about their schedules and the upcoming conference. It also automates the printing all relevant schedules, rosters, and more, helping to streamline the conference itself.

### Author's note
Code was created by Becky Hodge; any updates, as well as maintainence of this repository, is also handled by Becky Hodge.
