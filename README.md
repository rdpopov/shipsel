# State machine

 Menu       => GameStart
            => Settings
            => Scores
            => ExitPrompt

 GameStart  => LoadGame
            => Gememode Select
            => EnemyDesigner 
            => Self Designer => GameStart
            => Skiltree => GameStart
            => Menu

 Settings   => Menu
            => Game
            => Settings
            => Scores

 Game       => Pause

 Pause      => Game
            => Menu
            => Settings
            => Scores
            => ExitPrompt

 ExitPrompt => Exit - Terminal state
            => Game
            => Menu
            => Settings
            => Scores
