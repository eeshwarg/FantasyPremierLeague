# Fantasy Premier League

This is a web application where users can form their own virtual teams by buying football players and competing against other users. The objective of a user is to form a team, choosing players who are likely to perform well, keeping in mind a maximum budget allowed for the user.

Initially, a user is presented with statistics of players' performance in the recent past. Also, each user has a starting budget spending which they can pick their squad. At the end of each game, the players' statistics are updated and users who own the players involved in the game are awarded points suitably. The user will also have an  option to buy or sell players during the course of the season. When all the matches in the season have come to an end, the users are ranked in decreasing order of total points earned over the time period. The user with the highest total points wins the league. 

## Getting started

### Built with

* [Ruby on Rails](http://rubyonrails.org/) - The web framework used
* [MySQL](https://www.mysql.com/) - The database management system used
* [Bootstrap](http://getbootstrap.com/) - The front-end framework used

### Dependencies

This app was built using Ruby version 2.0.0 and Rails 4.0.8. Other than these, numerous Ruby [gems](http://guides.rubygems.org/what-is-a-gem/) (listed in the [Gemfile](https://github.com/eeshwarg/FantasyPremierLeague/blob/master/Gemfile)) are used. 

### Installation
First, [Ruby Version Manager](https://rvm.io/)(RVM) has to be installed using the command 
```
curl -sSL https://get.rvm.io | bash -s stable
```
Other dependencies for Ruby can be installed using
```
sudo apt-get install libtool libxslt libksba openssl
```
and 
```
sudo apt-get install libyaml-dev
```
Finally, Ruby itself can be installed using
```
rvm install 2.0.0 --with-openssl-dir=$HOME/.rvm/usr
```
Since RVM is already installed, Rails(which itself is just a Ruby gem) can be easily installed using 
```
gem install rails --version 4.0.8
```
Other packages need to be installed if you're using a version of Linux.
```
sudo apt-get install libxslt-dev libxml2-dev libsqlite3-dev
```

Once these are done, clone the repository and in the project root directory, run the command:
```
bundle install
```
to install the other necessary Ruby gems.

### Database creation and initialization

In the project directory, run the commands ```rake:db create``` and ```rake:db migrate``` to create the database and the tables with the desired structure. The entries for `players` and `teams` tables can be fetched from the Internet using scripts.

## Deployment

In the project root folder, run the following command to launch the app
```
rails server
```
Open a browser and navigate to ```localhost:3000```.



