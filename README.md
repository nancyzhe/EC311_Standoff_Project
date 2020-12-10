# EC311: Logic Design Project


## Project Name: Standoff

### Team Members:
* **Guillermo Ao** - [rao-dotcom](https://github.com/rao-dotcom)
* **Suyash Bhatia** - [suyash21101](https://github.com/suyash21101)
* **Daniel Cabrera** - [dcabrera101](https://github.com/dcabrera101)
* **Federico Coppo** - [fdcoppo](https://github.com/fdcoppo)
* **Nancy Zheng** - [nancyzhe](https://github.com/nancyzhe)


### [Project Demo Video Link Here](https://www.youtube.com/watch?v=eXyeJoGngCI&feature=youtu.be)

### Table of Contents:

* [Organization](#organization)
* [Project Overview](#projectoverview)
* [How to Run](#how_to_run)
* [How to Play](#how_to_play)
* [Code Structure Overview](#code_structure)
           

<a name="organization"></a> 
### Organization:
        
   * ***Folders***
        * Design Files: Includes all of the necessary design files to implement our design.
        * Testbench Files: Includes all of the necessary testbenches to test our design.
        * Constraints: Includes our constraint file to implement project on the FPGA.
   * ***Powerpoint***
        * Powerpoint detailing the design and structure of our project.
        
        
<a name="projectoverview"></a>   
### Project Overview:    

Our implementation of Standoff is one player game against the computer similar to game we all know: Rock, Paper, Scissors. The player starts with three lives and one bullet in the barrel. The bullet count will be shown through the LEDs. At the beginning of each round, the player has three options:
* Shoot
* Reload
* Duck

A countdown will be shown on the LEDs to signal to the player when to make his or her move. Based on the combination of moves from Player 1 and the computer which we will call Player 2, a specific result will occur.

  Player 1 | Player 2 | Result
  ---------|----------|------- 
  Shoot | Shoot | Both lose a bullet, no life lost
  Duck | Duck | Nothing
  Reload | Reload | Both gain a bullet
  Shoot | Duck | P1 lose bullet
  Duck | Shoot | P2 lose bullet
  Shoot | Reload | P1 lose bullet, P2 lose life
  Reload | Shoot | P1 lose life, P2 lose bullet
  Duck | Reload | P2 gains bullet
  Reload | Duck | P1 gains bullet

**Special Cases:**
* If either player has zero bullets and chooses to shoot, shoot is unsuccessful and action counts as a turn.
* If either player has three bullets in their barrel and chooses to reload, player does not gain a bullet.

At the end of each round, the player's previous move will be shown on the seven-segment display to avoid any confusion. Usually the bullet count would be private to keep the game fair, but for the purpose of the demo, we decided to show the bullet count of each player on the seven segment display to demonstrate that it functions properly and correctly.

A ***winner*** will be announced on the seven-segment display when one player has lost all three lives. 

<a name="how_to_run"></a>      
### How to Run: ***(Compatible with XLINX NEXYS A7 FPGA Board)***    

  * Download [Vivado Version 2019.2](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2019-2.html)
  * Once installed, load the application:
  * Set up a new project following the steps below:
      * Click `Create Project`, and then click `Next`.
      * Give the project a name (i.e. Standoff_Project) and a location to save, click `Next`.
      * Choose *RTL Project* and select the "*Do not specify sources at this time*" checkbox. Click `Next`.
      * Find the compatible FPGA for our project, under the 'Parts' option, specify (as shown below):
      
          Parts | Selection
           ------|-------------
          Product Category | All
          Family | Artix-7
          Package | csg324
          Speed | -1
          Part | xc7a100tcsg324-1
          
      * Click *Next* and *Finish*
      
  * Adding the Design files: 
      * Download all the files from **Design Files** in the repository.
      * In Vivado, select `Project Manager` in the *Flow Navigator*, click on `Add Sources`.
      * Select `Add or create design sources`, and click `Next`.
      * Select `Add Files` and add all the files from the **Design Files** folder provided in the repository.
      * After adding all the necessary files, click `Finish`.
      
  * Adding the Constraint File:
      * Download the constraint file from the folder in the repository.
      * In Vivado, select `Project Manager` in the *Flow Navigator*, click on `Add Sources`.
      * Select `Add or create constraints`, and click `Next`.
      * Select `Add Files`, add the necessary constraint file, and click `Finish`.
       
  * Make sure system.v file is set as the top module (To do this, right click on the system.v file under Design Sources, and click *Set as Top*)
  * Pushing it to the FPGA: 
      * Plug the keyboard and earphones in the FPGA. 
      * Select `Run Synthesis` under the *Synthesis* tasks of the *Flow Navigator* pane, and click `OK`. Wait for the synthesis process to complete.
      * Once synthesis is complete, select `Run Implementation`, and click `OK`. 
      * Once *Implementation* is completem select `Generate Bistream` and click, `OK`.
      * Selet the `Open Hardware Manager` under *Program and Debug* in the *Flow Navigator* tab.
      * Click on `Open target` link.
      * From the dropdown menu, click `Auto Connect`
      * Observe that the session status changes from Unconnected to the server name and the device is highlighted.
      * Click `Program Device` on the top green bar. A green LED labeled **DONE** on the FPGA should light up. 
      
 * The FPGA should now be programmed and ready to play! :+1: 
           
           
           
<a name="how_to_play"></a>     
### How to Play: :smiley:
+ Life Count &#8594; Displayed on the seven-segment display (for demo purposes only).
+ Bullet Count &#8594; Displayed using LEDs.

1. Start with the `pause` switch on (which is the rightmost swtich).
2. Select your time setting using the switches (demo setting for a 7 second countdown and normal setting for a 3 second countdown).
3. Select your initial move on the keyboard. 
     * U &#8594; Shoot
     * I &#8594; Reload
     * O &#8594; Duck
4. Unpause by moving the `pause` switch back down. 
5. Monitor the changes in bullet count to see when a round has passed. (*the countdown is functional but timing is off so it's important to focus on the bullet count and your move instead.*)
6. The player's move will also be displayed on the seven segment display:
     * S &#8594; Shoot
     * r &#8594; Reload
     * d &#8594; Duck
     * \- &#8594; Idle (make an invalid decision)
7. Continue making moves using the keyboard each round and monitoring the bullet count, life count, and moves.
8. When either the player or computer reaches zero lives, a sound will indicate that someone has won the game.
           
           
<a name="code_structure"></a>     
### Code Structure Overview:
      
      
<details>
<summary>Design Files</summary>
           
***Here is the structure of our Verilog Codes! We provided both our codes for our design with a keyboard and for buttons.***

<details>
      <summary> Top Module with Keyboard </summary>
   
   *This includes all the design sources used to implement our fully-functional game in Vivado with a keyboard as the input.*
           
+ `top_module.v` 
    + `top_keyboard.v` &#8594; top module for keyboard to be used to receive inputs
        + `Ps2_receiver.v`
             + `keyboard_debouncer.v`
        + `keyboard_decoder.v`
    + `set_roundtime.v`
    + `bullet_fsm.v` &#8594; module that outputs the number of bullets of each player
    + `display_bulletcount.v`
    + `simple_computer.v` 
        + `random_number.v` &#8594; module that generates random number that will determine the computer's move
             * `lfsr.v`
                  * `flip_flop.v`
                  * `load_mux.v`
    + `choice_valid.v` &#8594; module to check if a player's choice is valid (i.e. cannot reload when you have three bullets, so move is "*idle*")
    + `outcome_calc.v` &#8594; module that outputs the result of each round based on the moves by both player
    + `life_count.v` &#8594; module that outputs the number of lives of each player
    + `display_decoder.v`
    + `display_scores.v`
    + `audio.v` &#8594; module for the audio the game makes when someone wins  
           
</details>

    
<details>
<summary> Top Module w/o Keyboard (using buttons instead)</summary> 
           
*Additionally, these are the modules used to implement the game using push buttons. We implemented this incase the keyboard would not work. They keyboard ended up working and we decided to use that to receive inputs. We included all the files for our design with buttons just to show our process and work.*

+ `top_wo_kb.v`
    + `set_roundtime.v`
    + `bullets_fsm.v` 
    + `display_bulletcount.v`
    + `simple_computer.v`
         + `random_number.v`
              + `lfsr.v`
                  * `flip_flop.v`
                  * `load_mux.v`
    + `choice_valid.v` 
    + `outcome_calc.v` 
    + `life_count.v`
    + `display_decoder.v` 
    + `display_scores.v` 
 + `button_selection.v` &#8594; module to take in button inputs
 + `computer_decision.v` &#8594; module to determine the computer's action
   
</details>
</details>




<details>
<summary>Testbench Files</summary>

*These are our testbench files we used to test our design.*

+ `top_module_tb.v`
+ `top_wo_kb_tb.v`
+ `computer_tb.v`
+ `display_tb.v`
+ `life_count_tb.v`
+ `outcome_calculator_tb.v`
+ `tb_PS2Receiver.v`
+ `tb_set_roundtime.v`

</details>   

<details>
<summary>Constraints</summary>
     
 *This is the constraint file use in our design to push it to the FPGA (XLINX NEXYS A7 FPGA Board).*
 
+ `Nexys4DDR_Master.xdc`

                         
