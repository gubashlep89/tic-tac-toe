# README

## Reflection

### I usually start projects from planning:
- Define the end result:
    - Tic-tac-toe game with regular rules for two players written with Ruby on Rails
- Define key steps:
    - Check similar projects and best practices
    - Database schema
    - Routes schema
    - Generate models
    - Generate controllers and routes
    - Views and stylesheets
    - Libraries
    - Write tests scenarios
    - Autotest planning
    - Realization
    - Testing
    - Reflection
- Estimation

The realization based on standard Ruby on Rails `MVC` patter, I also used `service object` (GameBuilderService) 
to build Game object and `restful resource pattern`. My goal was to make the code safe, readable, well structured,
easy to adjust and well tested. I also added a few ruby gems to make work faster and in more consistent way.

What I like during the project is the end goal. It's not an abstract calculations or any other task from LeetCode.
Ruby on Rails is great instrument to make prototypes or small applications like this, however with strong planning 
and best practices the application can easily grow and stay safe, adjustable and with consistent codebase.

What was a bit tricky for me is to work with visual part. Last two years I've been working with API or 
backend focused services, so I spent a few moments with recalling how it works. Luckily I have experience
with `Rails 7`, `Hotwire` and `Stimulus`.


### If I have more time I would do a few things: 

- Prepare one player mode.
- Refactor visual part:
  - Add precompiler like Vite or similar, add more visual effects.
- Deploy to Heroku or similar service
- Add github actions
