;##################################################################################################
;# Powerup: Bunny Mario
;# Author: Nintendo (Original), SubconsciousEye (Port)
;# Description: The Super Carrot Powerup from Super Mario Land 2, with near-accurate behavior.


;################################################
;# General behavior

;# Enable spinjumping with this powerup.
!bunny_can_spinjump = !no

;# Enable climbing with this powerup.
!bunny_can_climb = !yes

;# Enable crouching with this powerup.
!bunny_can_crouch = !yes

;# Enable sliding with this powerup.
!bunny_can_slide = !yes

;# Enable carrying items with this powerup.
!bunny_can_carry_items = !yes

;# Enable riding Yoshi with this powerup.
!bunny_can_ride_yoshi = !yes


;################################################
;# Powerdown

;# Which animation will be used when being hurt
;# Available:
;#   - "shrink": Plays the powerup shrinking animation
;#   - "palette": Cycles through some palettes
;#   - "smoke": Leaves a smoke particle while making the player invisible
;# Note that if this powerup uses custom code and not macros this setting will be ignored.
!bunny_powerdown_action = "shrink"

;# Which powerup number the player will have after being hurt
!bunny_powerdown_power_num = $00

;# SFX number & port when getting hurt while using this powerup
!bunny_powerdown_sfx_num = $04
!bunny_powerdown_sfx_port = $1DF9|!addr


;################################################
;# Item ID

;# Item ID associated to this powerup.
!bunny_item_id = $0f


;################################################
;# Graphics/Player image

;# Player 1's graphics index for this powerup.
!bunny_p1_gfx_index = $0f

;# Player 2's graphics index for this powerup.
!bunny_p2_gfx_index = $0f

;# Player 1's EXTRA graphics index for this powerup.
!bunny_p1_extra_gfx_index = $0e

;# Player 2's EXTRA graphics index for this powerup.
!bunny_p2_extra_gfx_index = $0e


;################################################
;# Player palette

;# Player 1's palette index
!bunny_p1_palette_index = $08

;# Player 2's palette index
!bunny_p2_palette_index = $09


;################################################
;# Graphical options

;# Determines the Y displacement where the water splash will appear in relation to the player
;# This is affected by collision data
!bunny_water_y_disp = $0010

;# Same as above, but when the player is riding Yoshi
!bunny_water_y_disp_on_yoshi = $0004


;################################################
;# Hitbox, interaction & collision options

;# Player's hitbox X displacement from player's origin
!bunny_hitbox_x_disp = $0002

;# Player's hitbox width
!bunny_hitbox_width = $0C

;# Player's hitbox Y displacement from player's origin
!bunny_hitbox_y_disp = $0006

;# Player's hitbox height
!bunny_hitbox_height = $1A

;# Player's hitbox Y displacement from player's origin while crouching
!bunny_hitbox_y_disp_crouching = $0014

;# Player's hitbox height while crouching
!bunny_hitbox_height_crouching = $0C

;# Player's hitbox Y displacement from player's origin while mounted on Yoshi
!bunny_hitbox_y_disp_on_yoshi = $0010

;# Player's hitbox height while mounted on Yoshi
!bunny_hitbox_height_on_yoshi = $0020

;# Player's hitbox Y displacement from player's origin while crouching and mounted on Yoshi
!bunny_hitbox_y_disp_crouching_on_yoshi = $0018

;# Player's hitbox height while crouching and mounted on Yoshi
!bunny_hitbox_height_crouching_on_yoshi = $18


;################################################
;# Powerup-specific customization

;# Amount of frames the player will display the "shooting fireball" pose
!bunny_pose_pose_timer = $08


;#######################
;# Mandatory macro (do not touch).

%setup_general_defines(!bunny_powerup_num)