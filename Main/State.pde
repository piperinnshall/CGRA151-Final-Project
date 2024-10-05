enum MenuState {
    MENU,
    SETTINGS,
    CREDITS,
}

enum GameState {
    LOADING,
    TUTORIAL,
    PLAYING,
    PAUSED,
    GAME_OVER,
    VICTORY,
}

MenuState menuState = MenuState.MENU; 
GameState gameState = GameState.LOADING; 
