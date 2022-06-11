# Second Guessed
Second Guessed is a multi-player guessing game designed and built by Noah Reece & Jasmine Elkins for the Phase 3 project for Flatiron School's Software Engineering Bootcamp. The assignment was to build a single page application in 5 days using Sinatra, Ruby, and ActiveRecord for the back-end and React JS for the front-end. The concept was inspired by the board game Dixit and Jackbox's mobile game Drawful.

The game is designed to be played by a group of 3 or more players. Each round of Second Guessed consists of three phases (submitting, voting, and results) lasting for a total of 90 seconds. At the start of each turn a random image is generated from the Lorem Picsum API. Each player then has 30 seconds to submit a word or phrase that they think describes the image, 30 seconds to vote on one of the submissions, and 30 seconds to view the results of the round. Currently there is one game running on the server; when a player opens the web page, they will automatically join that game in its current phase.

Players do not have to register or create a log in; their session data is stored in the browser's local storage. Upon opening the web page, each user will be automatically assigned a random Guest ID. They can change this to whatever they want and the browser will remember their username any time they log in after that, until the browser cache is cleared.

In the future we plan to rewrite the game structure to give users the choice between joining the main, ongoing game, or starting individual game sessions with their own groups. In this structure each game would have a unique game ID and friends could then join using that ID.

Second Guessed has been deployed on Heroku and Netlify and can be played here: https://dashing-paletas-01a643.netlify.app/

# Learnings

- Ruby
- ActiveRecord
- Sinatra
- Game logic
- Responsive web design
- Deploying to Heroku and Netlify
- Database management & ORMs
- React useState and useEffect
- Using external component libraries: adding a QR coded and confetti
- Using local storage to save users without requiring a log in/account or cookies

# CREDITS
- **Background:** Black background vector created by freepik - www.freepik.com
- **Favicon:** Medal Second Place icon by Icons8

# REACT LIBRARIES:
- **QR Code:** https://www.npmjs.com/package/react-qr-code
- **Confetti:** https://www.npmjs.com/package/react-confetti
