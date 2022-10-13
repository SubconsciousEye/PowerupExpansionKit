;##################################################################################################
;# Powerup: Lankario (AKA Lankio AKA Weird Mario)
;# Author: Nintendo (Original), SubconsciousEye (Port)
;# Description: The Weird Mushroom Powerup from Super Mario Maker.
;#
;# ;# Pointers to smooth animation data
;# Format: XX YY
;#  - XX: Pose number
;#  - YY: Amount of frames the pose will be shown (minus 1)
;#        $FF = Show this frame forever (end of animation)
;#        $FE = Loop the animation
;#        $FD = Jump to animation index $XX

.index						; extended_anim_pose
    db $00                  ; [00]      Idle
    db $00,$00              ; [01-02]   Walking
    db $00                  ; [03]      Looking Up
    db $00,$00,$00          ; [04-07]   Running
    db $00                  ; [07]      Idle, holding an item
    db $00,$00              ; [08-09]   Walking, holding an item; second byte is also used for Jumping/Falling
    db $00                  ; [0A]      Looking up, holding an item
    db $00                  ; [0B]      Jumping
    db $00                  ; [0C]      Jumping, max speed
    db $00                  ; [0D]      Skidding
    db $00                  ; [0E]      Kicking item
    db $08                  ; [0F]      Looking to camera; spinjump pose, going into a pipe pose
    db $00                  ; [10]      Diagonal
    db $00,$00,$00          ; [11-13]   Running up wall
    db $00                  ; [14]      Victory pose, on Yoshi
    db $00                  ; [15]      Climbing
    db $00,$00              ; [16-17]   Swimming Idle; second byte is used for holding an item
    db $00,$00              ; [18-19]   Swimming #1; second byte is used for holding an item
    db $00,$00              ; [1A-1B]   Swimming #2; second byte is used for holding an item
    db $00                  ; [1C]      Sliding
    db $00                  ; [1D]      Crouching, holding an item
    db $00                  ; [1E]      Punching a net
    db $00                  ; [1F]      Swinging on net, showing back
    db $00                  ; [20]      Mounted on Yoshi; Swinging on net, side
    db $00                  ; [21]      Turning around on Yoshi, facing camera; Swinging on net, facing camera; Going into a pipe on Yoshi
    db $00                  ; [22]      Climbing, facing camera
    db $00                  ; [23]      Punching a net, facing camera
    db $00                  ; [24]      Falling
    db $00                  ; [25]      Showing back; spinjump pose
    db $00                  ; [26]      Victory pose
    db $00,$00              ; [27-28]   Commanding Yoshi
    db $00                  ; [29]      Going into a pipe on Yoshi (Weird Crouch)
    db $00,$00              ; [2A-2B]   Flying with cape
    db $00                  ; [2C]      Slide with cape while flying
    db $00,$00,$00          ; [2D-2F]   Dive with cape
    db $00,$00              ; [30-31]   Burned, cutscene poses
    db $00                  ; [32]      Looking in front, cutscene pose
    db $00,$00              ; [33-34]   Looking at the distance, cutscene pose
    db $00,$00,$00          ; [35-37]   Using a hammer, cutscene pose
    db $00,$00              ; [38-39]   Using a mop, cutscene pose
    db $00,$00              ; [3A-3B]   Using a hammer, cutscene pose, most likely unused
    db $00                  ; [3C]      Crouching
    db $00                  ; [3D]      Shrinking/Growing
    db $00                  ; [3E]      Dead
    db $00                  ; [3F]      Shooting fireball
    db $00,$00              ; [40-41]   Unused
    db $00                  ; [42]      Using P-Balloon (Small Mario)
    db $00                  ; [43]      Using P-Balloon (Non-Small Mario)
    db $00,$00,$00          ; [44-46]   Copy of the spinjump poses (Non-Small Forms); Last byte is also a part of the Shrinking/Growing animation

.animations
    dw ..looping

;############################
;# Smooth animation for looping

..looping
    db $48,$04
    db $49,$04
    db $4A,$04
    db $4B,$04
    db $00,$FE

