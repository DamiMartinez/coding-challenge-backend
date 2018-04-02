# Damian Martinez's Badi Coding Challenge - Backend (Ruby on Rails)
![Zombies at Badi](https://user-images.githubusercontent.com/4199523/33260366-e54216aa-d35f-11e7-8442-8d9e1cd67d88.jpg)

## The context
You are a scientist in a post-apocalyptic world. In your lab you have plenty of human tissues, yet not so many brains. For this reason, you decide to create zombies, which you then equip with armors and weapons. Why would you do that? Well, we cannot tell you. The only thing you need to know is that you are a crazy scientist playing on the edge of life and death.

## Instructions

* Fork this repo and clone your fork in your local machine. Alternatively, if you prefer to keep your challenge private, just download the code of this repo and send the final result to jobs@badiapp.com.
* The challenge is on! Implement the 6 steps described below;
* Create a pull request. 

## What we expect
* Build a performant, clean and well structured solution;
* Commit **early and often**. We want to be able to check your progress;
* Feel free to address the problem creatively according to your programming tastes (there are always multiple ways to achieve the same goal) and try to use elegant solutions. 

## The Challenge

Create a fully-working API that allows to perform the following operations:

1. Create Zombies. Each zombie can have weapons and armors;
2. Update a Zombie's attributes, including (but not limited to) weapons and armors;
4. Search Zombies according to their attributes, weapons and armors;
3. Destroy a Zombie;
5. Make your API public. Deploy it using the service of your choice (e.g. AWS, Heroku, Digital Ocean...);
6. Create a Readme file including a short explanation of your technical choices and (if you wish) ideas and suggestions.

## The Solution

First of all, I have downloaded and installed the repository on my computer. After that, I set up the environment and I did the following:

1. I have created the Zombies controller and the routes for the API.
2. I have defined the CRUD methods for Zombies controller.
3. I have created the Armors and Weapons controllers with the routes and CRUD methods, as well.
4. I have deployed the API on DigitalOcean (http://167.99.211.185:3000/).

## The API

These are the calls to the API:

### Create Zombie
**URL:** /zombies <br />
**Method:** POST <br />
**Data Params:** Required: name=[string]; Not required: hit_points=[integer], brains_eaten=[integer], speed=[integer], weapon_id=[integer], armor_id=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Show Zombie
**URL:** /zombies/:id <br />
**Method:** GET <br />
**URL Params:** Required: id=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Index All Zombies
**URL:** /zombies <br />
**Method:** GET <br />
**URL Params:** None <br />
**Success Response:** Status: 200, Content: JSON object <br />

### Update Zombie
**URL:** /zombies/:id <br />
**Method:** PUT <br />
**URL Params:** Required: id=[integer] <br />
**Data Params:** name=[string], hit_points=[integer], brains_eaten=[integer], speed=[integer], weapon_id=[integer], armor_id=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Search Zombies
**URL:** /zombies/search <br />
**Method:** POST <br />
**Data Params:** name=[string], hit_points=[integer], brains_eaten=[integer], speed=[integer], weapon_id=[integer], armor_id=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Destroy Zombie
**URL:** /zombies/:id <br />
**Method:** DELETE <br />
**URL Params:** Required: id=[integer] <br />
**Success Response:** Status: 200, Content: {status: 'Successful'} <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Create Weapon
**URL:** /weapons <br />
**Method:** POST <br />
**Data Params:** Required: name=[string]; Not required: attack_points=[integer], durability=[integer], price=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Index All Weapons
**URL:** /weapons <br />
**Method:** GET <br />
**URL Params:** None <br />
**Success Response:** Status: 200, Content: JSON object <br />

### Show Weapon
**URL:** /weapons/:id <br />
**Method:** GET <br />
**URL Params:** Required: id=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Update Weapon
**URL:** /weapons/:id <br />
**Method:** PUT <br />
**URL Params:** Required: id=[integer] <br />
**Data Params:** name=[string], attack_points=[integer], durability=[integer], price=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Destroy Weapon
**URL:** /weapons/:id <br />
**Method:** DELETE <br />
**URL Params:** Required: id=[integer] <br />
**Success Response:** Status: 200, Content: {status: 'Successful'} <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Create Armor
**URL:** /armors <br />
**Method:** POST <br />
**Data Params:** Required: name=[string]; Not required: defense_points=[integer], durability=[integer], price=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Index All Armors
**URL:** /armors <br />
**Method:** GET <br />
**URL Params:** None <br />
**Success Response:** Status: 200, Content: JSON object <br />

### Show Armor
**URL:** /armors/:id <br />
**Method:** GET <br />
**URL Params:** Required: id=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Update Armor
**URL:** /armors/:id <br />
**Method:** PUT <br />
**URL Params:** Required: id=[integer] <br />
**Data Params:** name=[string], defense_points=[integer], durability=[integer], price=[integer] <br />
**Success Response:** Status: 200, Content: JSON object <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

### Destroy Armor
**URL:** /armors/:id<br />
**Method:** DELETE <br />
**URL Params:** Required: id=[integer] <br />
**Success Response:** Status: 200, Content: {status: 'Successful'} <br />
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} <br />

