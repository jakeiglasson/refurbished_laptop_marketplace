# T2A2 Readme - Jake Glasson

## R7 Identification of the problem you are trying to solve by building this particular marketplace app.

Good performance laptops are too expensive. Cheap laptops have low performance. The problem is individuals need access to powerful laptops at an affordable price.
   
## R8 Why is it a problem that needs solving?

Individuals who are tight on money still need high performance laptops. Newer high end laptops cost too much.  By having access to refurbished laptops, individuals will be able to afford high performance laptops at an affordable price.

## R9 A link (URL) to your deployed app (i.e. website)

https://refurbished-laptop-marketplace.herokuapp.com/

## R10 A link to your GitHub repository (repo).
	- Ensure the repo is accessible by your Educators

https://github.com/jakeiglasson/refurbished_laptop_marketplace

## R11 Description of your marketplace app (website):

Purpose:

* Allow sellers to sell their refurbished laptops. Allow buyers who need high end laptops at an affordable price to buy these refurbished laptops.

Functionality / features:

* user signup
* different user accounts (seller, not seller, admin)
* users request seller status, granted by admin
* admin panel for crud functionality over database
* laptop listing creation for sellers (selling laptops)
* ability for users to 'buy' laptops

Sitemap:

![](./docs/refurbished_laptop_sitemap.png)

Screenshots:
![](./docs/website_screenshots/s1.png)
![](./docs/website_screenshots/s2.png)
![](./docs/website_screenshots/s3.png)
![](./docs/website_screenshots/s4.png)
![](./docs/website_screenshots/s5.png)
![](./docs/website_screenshots/s6.png)
![](./docs/website_screenshots/s7.png)
![](./docs/website_screenshots/s8.png)
![](./docs/website_screenshots/s9.png)
![](./docs/website_screenshots/s10.png)
![](./docs/website_screenshots/s11.png)


Target audience:

* Refurbished laptop resellers
* Individuals looking to buy power laptops at low prices

Tech stack (e.g. html, css, deployment platform, etc):

* Ruby on rails
* PotsgreSQL
* HTML
* CSS
* JAVASCRIPT
* AWS s3
* Deployment platform: Heroku

## R12 User stories for your app

### As a user (buyer and seller) i want to: 

* Update my existing details so that current information is up to date 

### As a seller i want to: 

* Post an ad for a refurbished laptop so buyers can purchase it
* Update an existing (unsold) ad in case an error was made
* Remove an existing ad in case that laptop is no longer available
* Access information on past sales so i have metrics on my sales

### As a buyer i want to:

* Browse all refurbished laptops for sale so that i can see what is available
* Request a seller account so i can sell refurbished laptops
* Browse laptops by brands so i can find a specific laptop brand to buy
* Filter available laptops by their components so i can find a laptop that matches my specification requirements
* Buy a refurbished laptop so that i have a powerful laptop that is affordable
* Sign up for an account so i know my information is secure and i can track my orders

## R13 Wireframes:

Desktop Wireframes

![](./docs/wireframe_desktop.jpg)

Mobile and Tablet Wireframes:

![](./docs/wireframe_mobile_tablet.png)

## R14 ERD:

![](./docs/erd_diagram.png)

## R15 Explain the different high-level components (abstractions) in your app:

### Active Record:

Active Record is a high level component that facilitates easy access and modifications to our database. Models inherit from Active Record which Inherits from the base facilitating the use of SQL commands.

Essentially this means that inside our models, active record can be called to perform actions such as create, read, update and delete. In the background Active Record executes the SQL to perform modifications requested in the model. 

### Active Storage:

Active Storage is a high level component that facilitates the ability to upload files easily. It facilitates uploading these files to could storage services such as Amazon S3, Google Cloud Storage, or Microsoft Azure Storage. These uploaded files are attached to Active Record objects.

Active storage also supports a disk based service allowing the storage of files locally for development and testing.

### Action View:

Action View is one component that handles web requests. It compiles the responses received from Action Controller (the other component of web requests) which is responsible for communicating with the database and performing CRUD operations on said database.  
  
Action View templates are written in ERB and HTML. Using Action View templates with ERB and HTML makes it possible to perform calculations and have them displayed on HTML pages, effectively turning HTML pages from static to dynamic.

## R16 Detail any third party services that your app will use:

AWS S3:

* Used to store images using AWS S3

Faker:

* Was used to help seed the database with placeholder data during production

Devise:

* Devise is used in the project to create user accounts and take a lot of the hard work out of managing these accounts.  

* Devise allows for accessing current user information between requests by handling the cookies and sessions.  

* By using devise I was able to restrict certain content based on whether a user was logged in or not.

Devise Guests:

* Used in combination with devise. Allows the generation of guest accounts when a user accesses the app while not logged in.

* Allows certain functionality such as buying items that is impossible without an account but still possible using a guest account

Cancancan:

* Cancancan is used in the project to restrict access to only those users who have the right privileges 

* Using Cancancan admins have access to all functions and the admin panel. 

* Via Cancancan all users can only perform crud on their own details, view laptop entries and buy a laptop they didn't list. 

* Via Cancancan seller users can list new laptops and have full crud over unsold laptops

Rails Admin:

* Gives access to an admin panel which provides full crud over all tables and entries in the database.

## R17 Describe your projects models in terms of the relationships (active record associations) they have with each other

### USERS:

The Users model has the following relationships:

* Each user may have many laptop orders.

* Each user may have many laptops (only if theyre a seller).

### LAPTOP BRANDS:

* Each laptop brand has many laptops.

### GRADES:

* Each grade has many laptops.

### CPUS:

* Each CPU has many laptops.

### RAM:

* Each RAM has many laptops.

### HARD DRIVES:

* Each Hard Drive has many laptops.

### LAPTOPS:

Each Laptop has one:

* user_id (foreign key in Users model):  
	
	This relation represents which User owns the laptop (the seller).

* brand_id (foreign key in Laptop Brands model):
	
	This relation represents what Brand a laptop has (i.e. Apple, Windows, Dell).

* grade_id (foreign key in Grades model)  
	
	This relation represents the Grade a laptop has (The used condition of the laptop).
	
* cpu_id (foreign key in CPUS model):
	
	This relation represents what CPU a laptop has (i.e. i3, i7, amd).

* ram_id (foreign key in RAM model):
	
	This relation represents how much RAM a laptop has (i.e. 4gb, 8gb, 16gb).

* hard\_drive_id (foreign key in CPUS model):
	
	This relation represents the size of the internal Hard Drive of a given laptop has (i.e. 128gb, 256gb, 1tb).

### LAPTOP ORDERS:

Each entry in Laptop Order has one user\_id and one laptop\_id.  
  
The user\_id corresponds to the user who has purchased the laptop, laptop_id corresponds to that laptop.

## R18 Discuss why you implemented your different tables and relations, explain how they work:

Users:

The Users table was implemented to keep a record of all users registered in the app. 

The Users table allows for the following information: name, email, password, seller status and admin status.

When a new user registers, the name, email and password given are entered into the Users table inside the database. Admin and seller status are set to false.

Laptops:

The laptops table was implemented to keep a record of all Laptops created inside the app. 

The laptops table allows for the following information: owner / seller (connected through a foreign key to the Users table), model number, price and sold status. 
  
The laptops table also allows for the following components that belong to a laptop: brand, grade, CPU, RAM and hard-drive.

The relationship connecting a User (owner / seller) to a Laptop was created so that the app could track which user created which laptop so that information regarding that laptop could be communicated to the seller.

Laptop Orders:

The Laptop Orders table was implemented to keep track of which users have purchased laptops. 

The laptop Orders table allows for the following information: a user_id connecting to the Users table as well as a laptop_id connecting to the Laptops table. 

For each entry these keys relate such that the user_id is the user who purchased the laptop denoted by laptop_id.

Laptop Components:

The laptop components (brands, grades, CPUs, RAM, hard-drives) tables were implemented so that each one could be easily modified and updated.  
  
By implementing each component as its own table instead of as a column inside of Laptops the app isn't filled with repeated unsanitized data.

## R19	Provide your database schema design

DBML file supplied in docs and db folder inside src

## R20	Describe the way tasks are allocated and tracked in your project

Tools Used:

* Trello

Process:

* Ideas / features / improvements are placed in a card call Braindump. 

* From this they are sorted into two columns; NICE TO HAVE and TODO

* The NICE TO HAVE card is for nonessential features that would improve the app but aren't necessary to produce an MVP

* The TODO card consists of features that need to be implemented

* Everyday, features are assigned to be completed from the TODO card, these are placed in the DOING card

* Any work that is postponed is placed in the IN PROGRESS card

* Once a feature is finished it is placed in the DONE / NEEDS TESTING card

* Once a feature is fully tested and deemed working, it is placed in the DONE card

* When work is interrupted, a brief description of what you were working on is placed in the WHAT YOU WERE WORKING ON BEFORE YOU STOPPED card. What work to commence when the interruption is gone is placed in the WHAT TO DO WHEN YOU GET BACK card.



