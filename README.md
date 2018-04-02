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
**URL:** /zombies
**Method:** POST
**Data Params:** Required: name=[string]; Not required: hit_points=[integer], brains_eaten=[integer], speed=[integer], weapon_id=[integer], armor_id=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} 

### Show Zombie
**URL:** /zombies/:id
**Method:** GET
**URL Params:** Required: id=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

### Index All Zombies
**URL:** /zombies
**Method:** GET
**URL Params:** None
**Success Response:** Status: 200, Content: JSON object

### Update Zombie
**URL:** /zombies/:id
**Method:** PUT
**URL Params:** Required: id=[integer]
**Data Params:** name=[string], hit_points=[integer], brains_eaten=[integer], speed=[integer], weapon_id=[integer], armor_id=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

### Search Zombies
**URL:** /zombies/search
**Method:** POST
**Data Params:** name=[string], hit_points=[integer], brains_eaten=[integer], speed=[integer], weapon_id=[integer], armor_id=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} 

### Destroy Zombie
**URL:** /zombies/:id
**Method:** DELETE
**URL Params:** Required: id=[integer]
**Success Response:** Status: 200, Content: {status: 'Successful'}
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

### Create Weapon
**URL:** /weapons
**Method:** POST
**Data Params:** Required: name=[string]; Not required: attack_points=[integer], durability=[integer], price=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} 

### Index All Weapons
**URL:** /weapons
**Method:** GET
**URL Params:** None
**Success Response:** Status: 200, Content: JSON object

### Show Weapon
**URL:** /weapons/:id
**Method:** GET
**URL Params:** Required: id=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

### Update Weapon
**URL:** /weapons/:id
**Method:** PUT
**URL Params:** Required: id=[integer]
**Data Params:** name=[string], attack_points=[integer], durability=[integer], price=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

### Destroy Weapon
**URL:** /weapons/:id
**Method:** DELETE
**URL Params:** Required: id=[integer]
**Success Response:** Status: 200, Content: {status: 'Successful'}
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

### Create Armor
**URL:** /armors
**Method:** POST
**Data Params:** Required: name=[string]; Not required: defense_points=[integer], durability=[integer], price=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('} 

### Index All Armors
**URL:** /armors
**Method:** GET
**URL Params:** None
**Success Response:** Status: 200, Content: JSON object

### Show Armor
**URL:** /armors/:id
**Method:** GET
**URL Params:** Required: id=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

### Update Armor
**URL:** /armors/:id
**Method:** PUT
**URL Params:** Required: id=[integer]
**Data Params:** name=[string], defense_points=[integer], durability=[integer], price=[integer]
**Success Response:** Status: 200, Content: JSON object
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

### Destroy Armor
**URL:** /armors/:id
**Method:** DELETE
**URL Params:** Required: id=[integer]
**Success Response:** Status: 200, Content: {status: 'Successful'}
**Error Response:** Status: 400, Content: {error: 'Something went wrong :('}

