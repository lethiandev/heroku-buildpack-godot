# Heroku Buildpack for Godot Engine

Experimental Heroku Buildpack for Godot Engine 3.4.

Requires HTML5 export named `HTML5` to be able to export and deploy the game.

# Troubleshooting

If your game is under a subdirectory on your repository, you can use the `git
subtree` command to export the game to the heroku's root directory.

```
git subtree push --prefix path/to/project heroku master
```
