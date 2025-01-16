# Pacman Assembly Game

Welcome to the Pacman Game created using Assembly language and the Irvine Library in Visual Studio 2022! This project runs in the Windows command prompt and includes exciting features such as ghost chase logic, multiple levels, and scoring.

## Features

- **Ghost Chase Logic**: The ghost chases Pacman using a distance-based algorithm that dynamically calculates the best direction to pursue.
- **Multiple Levels**: The game progresses through increasing difficulty levels as you collect more points.
- **Scoring**: Players earn points by consuming dots and avoiding ghosts.
- **Saving Scores**: The game saves the player's name and score to a file (`players.txt`) for future reference.
- **Game Instructions and Pause Feature**: Players can view instructions or pause the game during gameplay.

## Prerequisites
To run this project, you will need:
- **Visual Studio 2022**: Make sure it is installed on your system.
- **Irvine Library**: Install and configure the Irvine library for Assembly language in Visual Studio.
- **Windows OS**: This project is designed to run on a Windows environment.

## Installation Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/shahmeerahmed486/Pacman-Assembly-Project.git
   ```

2. Open Visual Studio 2022 and load the project solution file (`22i-1048.sln`).

3. Ensure the Irvine Library is correctly set up:
   - Copy `Irvine32.lib` and `Irvine.inc` to the appropriate folders in your Visual Studio setup.

4. Build the project by clicking on **Build Solution** (Ctrl + Shift + B).

5. Run the project from Visual Studio to start the game in the Windows command prompt.

## How to Play

- **Goal**: Collect dots while avoiding ghosts and achieve the highest score.
- **Movement**: Use the 'w', 'a', 's', 'd' keys to control Pacman.
- **Ghosts**: Avoid getting caught by the ghost, which dynamically adjusts its direction based on Pacman's location.
- **Levels**: Progress through levels by collecting enough points to unlock more challenging stages.
- **Pause**: Press `P` to pause the game and view instructions.
- **Save Scores**: Upon game completion, enter your name to save your score in `players.txt`.

## File Overview

- `Source.asm`: The main Assembly language code for the game.
- `Final_Project.vcxproj`: Visual Studio project file.
- `players.txt`: Stores player names and their scores.
- Sound files (`click_x.wav`, `pacman_beginning.wav`, `pacman_chomp.wav`, `pacman_death.wav`, `pacman_eatfruit.wav`): Audio effects for an enhanced gameplay experience.

## Technical Highlights

- **Ghost Chase Logic**: Uses a grid-checking mechanism that dynamically adjusts ghost movement based on Pacman’s position.
- **Level Progression**: The maze layout becomes more challenging as the player progresses.
- **File Handling**: Player scores are saved to `players.txt` using file I/O operations in Assembly language.

## Known Requirements and Compatibility
- Ensure the Irvine Library is set up correctly in your Visual Studio installation for successful compilation and execution.
- Tested on Windows 10 and Windows 11; may not run on non-Windows platforms.

## Contributions
Feel free to fork this repository and submit pull requests with improvements or fixes.

## Acknowledgments
- Special thanks to Kip Irvine for the Irvine Library.
- Inspiration from the classic Pacman game.

Enjoy playing the game! If you encounter any issues, open an issue in this repository or contact the project creator.

---

Happy gaming! 🎮

