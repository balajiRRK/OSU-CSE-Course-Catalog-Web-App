![image](https://github.com/cse-3901-sharkey/2024-su-Team-3-Lab-2/assets/93829096/0d78de88-14fa-47c9-8047-e347f2846bd4)

## Features/Capabilities of the App

This app provides an overview of all the CSE classes offered at OSU in a specific semester after a user logins with the account the made. **Accounts can only be made with an @osu.edu email**. There are 3 different account types: student, instructor, and admin. Account types can be selected upon registering, and student accounts will not need admin approval; *however, instructor and admin accounts will be approved by a current admin*. 

With a student account, the user can view courses and their sections in a given semester. 

With an instructor account, the user can view courses and their sections in a given semester (in a future update, instructors will be able to post openings for TA positions in their section and view applicants in order to hire a TA). 

With an admin account, the user can view courses and their sections in a given semester. Additionally, they can add/edit/remove courses and sections as well as approve instructor and admin accounts. 

![image](https://github.com/cse-3901-sharkey/2024-su-Team-3-Lab-2/assets/93829096/048e1135-2e2b-4ee8-bed0-27d649bc6ae9)

### Extra Functionalities

When viewing the course catalog, the user is able to search a course by title, course number, course level, and subject. This feature is an optional feature listed in the assignment that we chose to implement to make it easier for users to find their desired course.

***

## How to Install the App

This app requires Ruby 3.2.0 or newer versions. 
1. Clone the repo either through HTTPS or SSH
   - Through HTTPS: https://github.com/cse-3901-sharkey/2024-su-Team-3-Lab-2.git
   - Through SSH: git@github.com:cse-3901-sharkey/2024-su-Team-3-Lab-2.git
2. Run the following commands:
   ```
   bundle install
   bin/rails db:migrate
   bin/rails fetch_courses
   bin/rails fetch_sections
   bin/rails server
   ```
3. Open `localhost:3000` in your browser. 
   
***

## Troubleshooting the App

*Problem: Running `bundle install` gives the error*

*"Bundler::PermissionError: There was an error while trying to create. It is likely that you need to grant executable permissions for all parent directories and write permissions* *for `$HOME/.rbenv/versions/3.2.0/lib..`".*

Solution: Restart your computer. Open your terminal and change into the directory of the project. Run the command `bundle install` and `gem pristine --all`

***

*Problem: Entering localhost:3000 into browser gives "This site can't be reached" error*

Solution: Ensure that the rails server has been started and if not do `bin/rails server` to start the server

***

*Problem: Opening website with localhost:3000 gives this error* 

*"Zeitwerk::NameError expected file /home/user/dir/app/helpers/sections_helper.rb to define constant SectionsHelper, but didn't"*

Solution: Refresh browser page.

***

*Problem: Opening website with localhost:3000 gives this error*

*"ActiveRecord::PendingMigrationError Migrations are pending. To resolve this issue, run: bin/rails db:migrate"*

Solution: run `bin/rails db:migrate`

***

*Problem: Opening website with localhost:3000 gives this error*

*"SQLException: table table_name already exists*

Solution: run `bin/rails destroy model table_name`

***

## How to Use the App

*Register an account*

1. Click on "Register" on the navigation bar.

2. Fill in the boxes with your relevent information.

2. Your account is now registered! You're already logged in and can view classes. 

*Log into your account*

1. Click on "Login" on the navigation bar.
 
2. Fill in the boxes with your account information.

3. You are now logged in and can view classes!
   
*View courses*

1. Click on "Courses" on the top left of the navigation bar.
 
2. You are now able to view all CSE classes offered at OSU!

3. If you want to view sections for a specific course, click on "view" on the right side of the page in the same line of the course. 

*Search courses*

1. Click on "Courses" on the top left of the navigation bar.
 
2. Type in what class you are searching for via the course title, course number, course level, and/or subject.

3. You found the course you're looking for! If you want to view sections for a specific course, click on "view" on the right side of the page in the same line of the course.

***FOR ADMINS***

Default admin account: 
   - username: admin@osu.edu
   - password: team3pass

*Approve instructor and admin account requests*

*Create new course*

*Edit course*

*Delete course*

***

## Contributions

Shristi --  worked on all files related to user management 

Ryan -- worked on all files related to admin dashboard

Balaji -- worked on all files related to user database, handled all the CSS for the website, created the homepage and navigation bar

Javan -- worked on database, all files related to API integration, configuration of 'devise' gem for user, gemfile, fetch_courses.rake, and routes

Bikash -- worked on all files related to course catalog; implemented search by title, course number, course level, and subject on the course catalog

Ivy -- designed architecture of app, created issues, assigned issues, supervised meetings, worked on README file

***

## Citations/Sources

Architecture design inspirations:
- https://github.com/aiftikhar19/RateMyPeers/blob/master/project6/README.md
- https://github.com/Poitrin/university-management-system/blob/master/README.md

Sources to help learn Ruby on Rails 
https://guides.rubyonrails.org/getting_started.html

Sources to help learn how to use ruby gems
https://www.youtube.com/watch?v=9K5YvsrKBRk
